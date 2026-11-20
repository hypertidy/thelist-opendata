#!/usr/bin/env Rscript
## 23_thumbnails.R
## A small PNG preview per geospatial product, for the STAC catalogue (Portolan
## asks every geospatial collection for a thumbnail).
##
##   stac-thumbs/<product>.png      256 px on the long side
##   stac-thumbs/index.csv          product, path, sha256 of the file drawn
##
## Vectors: the geometry column only (DuckDB column projection over HTTPS),
## burned with controlledburn (exact coverage for polygons, cells touched for
## lines and points; no pixel grid until the small one we draw), shaded by
## density against the layer's own 95th percentile. Polygons: interiors pale,
## boundaries by density; a coverage with a boundary in nearly every cell
## (TASVEG, land use) would read as a solid block, so it is drawn instead as
## the outlines of each feature's bounding box, which shows where features are
## small and many. index.csv records the style used. Rasters: one
## decimated read, served from the COG overviews. A faint Tasmania outline sits
## behind data in MGA zone 55. Redrawn only when the file's sha256 changes.
##
##   Rscript R/23_thumbnails.R          # CORES=6

suppressPackageStartupMessages({ library(jsonlite); library(duckdb); library(controlledburn); library(wk); library(gdalraster); library(parallel) })

PUBLIC <- Sys.getenv("PUBLIC", "https://data.source.coop/mdsumner/thelist-opendata")
OUT    <- Sys.getenv("THUMBS", "stac-thumbs")
CORES  <- as.integer(Sys.getenv("CORES", "6"))
SIZE   <- 256L
INK    <- "#1f6f5c"; LAND <- "#e6e8e1"; LAND_LINE <- "#c4c8bc"
Sys.setenv(GDAL_DISABLE_READDIR_ON_OPEN = "EMPTY_DIR", GDAL_HTTP_MAX_RETRY = "5", GDAL_HTTP_RETRY_DELAY = "2")

cat_json <- fromJSON("site/catalog.json", simplifyVector = FALSE)
sums <- read.csv("manifest/checksums.csv", colClasses = "character")
sha <- setNames(sums$sha256, sums$path)
dir.create(OUT, showWarnings = FALSE)
idxf <- file.path(OUT, "index.csv")
idx <- if (file.exists(idxf)) read.csv(idxf, colClasses = "character") else data.frame(product = character(), path = character(), sha256 = character(), style = character())
if (!"style" %in% names(idx)) idx$style <- rep(NA_character_, nrow(idx))   # index from before styles: polygons get redrawn

## one file per product: the vector layer if there is one, else the first raster
items <- Filter(function(it) it$kind != "table", cat_json$items)
prod_of <- function(it) strsplit(it$path, "/")[[1]][2]
by_prod <- split(items, vapply(items, prod_of, ""))
pick <- lapply(by_prod, function(its) { k <- vapply(its, `[[`, "", "kind"); its[order(k != "vector", vapply(its, `[[`, "", "path"))][[1]] })
todo <- Filter(function(it) {
  p <- prod_of(it); r <- idx[idx$product == p, ]
  stale_style <- nrow(r) && is.na(r$style[1]) && grepl("Polygon", it$geometry %||% "")
  !(nrow(r) && r$path[1] == it$path && r$sha256[1] == sha[[it$path]] && file.exists(file.path(OUT, paste0(p, ".png"))) && !stale_style)
}, pick)
if (nzchar(Sys.getenv("PRODUCT"))) todo <- todo[grepl(Sys.getenv("PRODUCT"), names(todo), ignore.case = TRUE)]
message(length(pick), " geospatial products; ", length(todo), " thumbnails to draw")

## Tasmania outline (km, y negated, from the site catalogue) back to MGA55 metres
rings <- lapply(strsplit(sub("^M", "", cat_json$outline), "M")[[1]], function(r) {
  xy <- do.call(rbind, lapply(strsplit(strsplit(sub("Z$", "", r), "L")[[1]], " "), as.numeric))
  cbind(xy[, 1] * 1000, -xy[, 2] * 1000)
})
is_mga <- function(it) is.null(it$crs) || is.na(it$crs %||% NA) || startsWith(it$crs %||% "", "EPSG:28355") || !is.null(it$crs_note)

frame <- function(it) {
  b <- as.numeric(unlist(it$bbox)); if (length(b) == 6) b <- b[c(1, 2, 4, 5)]
  w <- b[3] - b[1]; h <- b[4] - b[2]; pad <- 0.03 * max(w, h)
  b <- b + c(-pad, -pad, pad, pad); w <- b[3] - b[1]; h <- b[4] - b[2]
  dim <- if (w >= h) c(SIZE, max(32L, as.integer(round(SIZE * h / w)))) else c(max(32L, as.integer(round(SIZE * w / h))), SIZE)
  list(ext = c(b[1], b[3], b[2], b[4]), dim = dim)
}
open_png <- function(f, fr) {
  png(f, width = fr$dim[1], height = fr$dim[2], type = if (capabilities("cairo")) "cairo" else "Xlib", bg = "white")
  par(mar = c(0, 0, 0, 0)); plot.new(); plot.window(fr$ext[1:2], fr$ext[3:4], xaxs = "i", yaxs = "i", asp = 1)
}
draw_land <- function(it) if (is_mga(it)) for (r in rings) polygon(r[, 1], r[, 2], col = LAND, border = LAND_LINE, lwd = 0.6)
to_colour <- function(m, col) {                     # coverage / count matrix -> colour matrix, alpha by value
  a <- pmin(1, m); a[is.na(a)] <- 0
  rgb0 <- col2rgb(col) / 255
  out <- matrix(rgb(rgb0[1], rgb0[2], rgb0[3], alpha = pmax(a, ifelse(a > 0, 0.35, 0))), nrow(m))
  out[a == 0] <- NA; out
}

thumb_vector <- function(it, f) {
  con <- dbConnect(duckdb(shared_home = FALSE)); on.exit(dbDisconnect(con, shutdown = TRUE))
  invisible(dbExecute(con, "INSTALL httpfs; LOAD httpfs; SET enable_geoparquet_conversion = false;"))
  url <- sprintf("%s/%s", PUBLIC, it$path)
  ## the primary geometry column is not always 'geometry' (files from bare gdbs keep 'SHAPE')
  geo <- dbGetQuery(con, sprintf("SELECT decode(value) v FROM parquet_kv_metadata('%s') WHERE decode(key) = 'geo'", url))$v
  gcol <- if (length(geo)) fromJSON(geo)$primary_column else "geometry"
  d <- dbGetQuery(con, sprintf('SELECT "%1$s" AS g FROM read_parquet(\'%2$s\') WHERE "%1$s" IS NOT NULL', gcol, url))
  g <- wk::wkb(unclass(lapply(d$g, as.raw))); rm(d)
  fr <- frame(it)
  x <- burn(g, extent = fr$ext, dimension = fr$dim)
  ## density relative to the layer's own 95th percentile, so dense networks still show texture
  alpha_of <- function(m, alpha = NULL) {
    q <- if (any(m > 0, na.rm = TRUE)) quantile(m[m > 0], 0.95, na.rm = TRUE) else 1
    a <- if (is.null(alpha)) pmin(1, 0.15 + 0.85 * m / q) else ifelse(m > 0, alpha, 0); a[is.na(a) | is.na(m) | m <= 0] <- 0
    dim(a) <- dim(m); a                                          # pmin() drops the matrix dims
  }
  img <- function(a) {
    k <- col2rgb(INK) / 255; out <- matrix(rgb(k[1], k[2], k[3], alpha = a), nrow(a)); out[a == 0] <- NA
    rasterImage(as.raster(out), fr$ext[1], fr$ext[3], fr$ext[2], fr$ext[4], interpolate = FALSE)
  }
  style <- "density"
  if (grepl("Polygon", it$geometry %||% "")) {
    ## polygons: interiors pale, boundaries by density, so coverages (parcels, land use) show their texture
    xi <- x; xi$edges <- x$edges[0, ]; xe <- x; xe$runs <- x$runs[0, ]
    ai <- alpha_of(materialise_chunk(xi, "sum"), 0.22); ae <- alpha_of(materialise_chunk(xe, "sum"))
    comp <- 1 - (1 - ai) * (1 - ae)
    if (mean(comp[comp > 0] >= 0.9) > 0.6) {
      ## a coverage with a boundary in nearly every cell (TASVEG, land use) reads as a solid block: draw
      ## each feature's bounding box as an outline instead, so the density of features shows through
      ## (dark where features are small and many). Envelopes of the geometry already read, no new I/O.
      e <- unclass(wk::wk_envelope(g)); n <- length(e$xmin)
      ls <- wk::wk_linestring(wk::xy(c(rbind(e$xmin, e$xmax, e$xmax, e$xmin, e$xmin)), c(rbind(e$ymin, e$ymin, e$ymax, e$ymax, e$ymin))),
                              feature_id = rep(seq_len(n), each = 5L))
      ab <- alpha_of(materialise_chunk(burn(wk::as_wkb(ls), extent = fr$ext, dimension = fr$dim), "sum"))
      open_png(f, fr); draw_land(it); img(ab); dev.off()
      return("bbox outlines")
    }
    open_png(f, fr); draw_land(it); img(ai); img(ae); dev.off()
    return("polygons")
  }
  open_png(f, fr); draw_land(it); img(alpha_of(materialise_chunk(x, "sum"))); dev.off()
  style
}
thumb_raster <- function(it, f) {
  r <- new(GDALRaster, paste0("/vsicurl/", PUBLIC, "/", it$path)); on.exit(r$close())
  fr <- frame(it)
  b <- as.numeric(unlist(it$bbox)); ext <- c(b[1], b[3], b[2], b[4])
  nx <- r$getRasterXSize(); ny <- r$getRasterYSize()
  ox <- min(nx, if (nx >= ny) SIZE else as.integer(round(SIZE * nx / ny))); oy <- min(ny, max(1L, as.integer(round(ox * ny / nx))))
  nb <- r$getRasterCount()
  band <- function(k) { v <- read_ds(r, bands = k, out_xsize = ox, out_ysize = oy); nd <- r$getNoDataValue(k)
                        if (!is.na(nd)) v[v == nd] <- NA; v[!is.finite(v)] <- NA; matrix(v, oy, ox, byrow = TRUE) }
  stretch <- function(v) { q <- quantile(v, c(0.02, 0.98), na.rm = TRUE); if (!all(is.finite(q)) || q[2] <= q[1]) q <- range(v, na.rm = TRUE) + c(0, 1e-9); pmin(1, pmax(0, (v - q[1]) / (q[2] - q[1]))) }
  if (nb >= 3) {
    rgbm <- lapply(1:3, function(k) stretch(band(k)))
    na <- is.na(rgbm[[1]]) | is.na(rgbm[[2]]) | is.na(rgbm[[3]])
    col <- matrix(rgb(ifelse(na, 0, rgbm[[1]]), ifelse(na, 0, rgbm[[2]]), ifelse(na, 0, rgbm[[3]])), oy); col[na] <- NA
  } else {
    v <- band(1)
    ## a class grid with no nodata set: a value on all four corners is the background
    cn <- c(v[1, 1], v[1, ncol(v)], v[nrow(v), 1], v[nrow(v), ncol(v)])
    if (!anyNA(cn) && length(unique(cn)) == 1) v[v == cn[1]] <- NA
    u <- unique(v[!is.na(v)])
    if (length(u) <= 16 && all(u == round(u))) {                 # class grid
      pal <- setNames(hcl.colors(max(3, length(u)), "Dark 3")[seq_along(u)], sort(u))
      col <- matrix(pal[as.character(v)], oy)
    } else {
      s <- stretch(v); pal <- hcl.colors(64, "viridis")
      col <- matrix(pal[pmax(1, ceiling(s * 64))], oy); col[is.na(s)] <- NA
    }
  }
  open_png(f, fr); draw_land(it)
  rasterImage(as.raster(col), ext[1], ext[3], ext[2], ext[4], interpolate = FALSE)
  dev.off()
}

res <- mclapply(todo, function(it) {
  p <- prod_of(it); f <- file.path(OUT, paste0(p, ".png"))
  style <- tryCatch(if (it$kind == "vector") thumb_vector(it, f) else { thumb_raster(it, f); "raster" },
                    error = function(e) { message(p, ": ", conditionMessage(e)); NA_character_ })
  data.frame(product = p, path = it$path, sha256 = if (!is.na(style)) sha[[it$path]] else NA_character_, style = style)
}, mc.cores = CORES, mc.preschedule = FALSE)
res <- do.call(rbind, res)
if (!is.null(res)) {
  idx <- rbind(idx[!idx$product %in% res$product, ], res[!is.na(res$sha256), ])
  write.csv(idx[order(idx$product), ], idxf, row.names = FALSE)
}
message("thumbnails: ", sum(file.exists(file.path(OUT, paste0(names(pick), ".png")))), " of ", length(pick),
        if (!is.null(res) && anyNA(res$sha256)) paste0("; failed: ", paste(res$product[is.na(res$sha256)], collapse = ", ")) else "")

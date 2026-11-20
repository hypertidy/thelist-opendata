#!/usr/bin/env Rscript
## 20_catalog.R
## site/catalog.json: one entry per statewide file in the store, for the
## listing site (site/index.html, published with GitHub Pages).
##
## Read from the store itself, so the listing is what is actually there:
##   file list and sizes      anonymous S3 listing (DuckDB read_blob, path style)
##   rows, columns, types     Parquet footers (parquet_file_metadata, parquet_schema)
##   geometry type, bbox, CRS GeoParquet 'geo' metadata
##   raster grid              GDAL over /vsicurl/
## and joined to the manifest for provenance:
##   source zip(s), release   manifest/converted.csv (store copy) + manifest/files.csv
## plus a simplified Tasmania outline (from the statewide LGA boundaries) for
## the small locator map.
##
##   Rscript R/20_catalog.R            # writes site/catalog.json

suppressPackageStartupMessages({ library(duckdb); library(jsonlite); library(gdalraster); library(geos); library(wk); library(PROJ) })

PUBLIC <- Sys.getenv("PUBLIC", "https://data.source.coop/mdsumner/thelist-opendata")
S3     <- "s3://us-west-2.opendata.source.coop/mdsumner/thelist-opendata"
OUT    <- Sys.getenv("CATALOG", "site/catalog.json")
Sys.setenv(GDAL_DISABLE_READDIR_ON_OPEN = "EMPTY_DIR", GDAL_HTTP_MAX_RETRY = "5", GDAL_HTTP_RETRY_DELAY = "2")

slug <- function(x) tolower(gsub("[^A-Za-z0-9]+", "_", x))
con <- dbConnect(duckdb(shared_home = FALSE))
invisible(dbExecute(con, "INSTALL httpfs; LOAD httpfs; SET s3_region = 'us-west-2'; SET s3_url_style = 'path';
                          SET enable_geoparquet_conversion = false;"))
rel <- function(x) sub(paste0("^", S3, "/"), "", x)

## ---- files ------------------------------------------------------------------
ls <- dbGetQuery(con, sprintf("SELECT filename, size FROM read_blob('%s/*/*/statewide/*')", S3))
ls <- ls[grepl("\\.(parquet|tif)$", ls$filename), ]
ls$path <- rel(ls$filename)
ls$sub  <- sub("/.*", "", ls$path)
ls$prod <- sub("^[^/]+/([^/]+)/.*", "\\1", ls$path)
message(nrow(ls), " statewide files")

## ---- parquet footers ------------------------------------------------------------
pq <- paste0(S3, "/*/*/statewide/*.parquet")
nrows <- dbGetQuery(con, sprintf("SELECT file_name, num_rows FROM parquet_file_metadata('%s')", pq))
geo <- dbGetQuery(con, sprintf("SELECT file_name, decode(value) v FROM parquet_kv_metadata('%s') WHERE decode(key) = 'geo'", pq))
sch <- dbGetQuery(con, sprintf("SELECT file_name, name, type, converted_type, num_children FROM parquet_schema('%s')", pq))
ptype <- function(type, conv) {
  out <- ifelse(is.na(conv), c(BYTE_ARRAY = "binary", INT32 = "int32", INT64 = "int64", DOUBLE = "double",
                               FLOAT = "float", BOOLEAN = "bool", FIXED_LEN_BYTE_ARRAY = "binary")[type],
                c(UTF8 = "string", INT_16 = "int16", INT_8 = "int8", DATE = "date", TIMESTAMP_MILLIS = "datetime",
                  TIMESTAMP_MICROS = "datetime", DECIMAL = "decimal")[conv])
  ifelse(is.na(out), tolower(type), out)
}
## top-level columns only: drop the root and the children of struct columns (geometry_bbox)
columns <- lapply(split(sch, sch$file_name), function(d) {
  keep <- rep(TRUE, nrow(d)); keep[1] <- FALSE
  i <- 2L
  while (i <= nrow(d)) { k <- d$num_children[i]; if (!is.na(k) && k > 0) { keep[i] <- FALSE; keep[i + seq_len(k)] <- FALSE; i <- i + k }; i <- i + 1L }
  d <- d[keep & !d$name %in% c("geometry", "geometry_bbox"), ]
  unname(Map(function(n, t) c(n, t), d$name, ptype(d$type, d$converted_type)))
})

## ---- raster headers ---------------------------------------------------------------
crs_label <- function(wkt) {
  if (!nzchar(wkt)) return(NA_character_)
  if (srs_is_same(wkt, srs_to_wkt("EPSG:28355"))) return("EPSG:28355")
  e <- tryCatch(srs_find_epsg(wkt), error = function(e) NULL)
  if (length(e) && !is.na(e[1])) sub("^(EPSG:)?", "EPSG:", e[1]) else srs_get_name(wkt)
}
ras <- ls[ls$sub == "cog", ]
rinfo <- lapply(ras$path, function(p) {
  r <- tryCatch(new(GDALRaster, paste0("/vsicurl/", PUBLIC, "/", p)), error = function(e) NULL)
  if (is.null(r)) return(NULL); on.exit(r$close())
  list(dim = r$dim()[1:2], bands = r$getRasterCount(), res = r$res(), bbox = r$bbox(),
       dtype = r$getDataTypeName(1), nodata = r$getNoDataValue(1), crs = crs_label(r$getProjection()))
})
names(rinfo) <- ras$path

## ---- provenance ---------------------------------------------------------------------
logf <- tempfile(fileext = ".csv"); download.file(paste0(PUBLIC, "/manifest/converted.csv"), logf, quiet = TRUE)
log <- read.csv(logf, colClasses = "character")
log$path <- gsub("/+", "/", sub("^out/", "", log$output))
log <- log[startsWith(log$status, "ok"), ]
files <- read.csv("manifest/files.csv", colClasses = "character")
products <- read.csv("manifest/products.csv", colClasses = "character")
pname <- setNames(products$product, slug(products$product)); pname["municipality"] <- "MUNICIPALITY"
src_info <- function(urls) {
  f <- files[match(urls, files$url), ]
  data.frame(name = basename(sub("/$", "", urls)), url = urls, released = substr(f$mtime, 1, 10),
             bytes = suppressWarnings(as.numeric(f$bytes)))
}
provenance <- function(path) {
  row <- log[log$path == path, ]
  if (!nrow(row)) return(list(kind = "unknown"))
  row <- row[nrow(row), ]
  if (startsWith(row$url, "lga-union:")) {
    parts <- strsplit(sub("^[^/]+/", "", path), "/")[[1]]            # prod, statewide, file
    sub_ <- sub("/.*", "", path); prod <- parts[1]
    stem <- sub("_statewide\\.(parquet|tif)$", "", parts[3])
    lg <- log[grepl(sprintf("^%s/%s/[^/]+/", sub_, prod), log$path) & !grepl("/statewide/", log$path), ]
    lg$region <- sub("^[^/]+/[^/]+/([^/]+)/.*", "\\1", lg$path)
    lg <- lg[basename(lg$path) == paste0(stem, "_", lg$region, ".", tools::file_ext(path)) |
             (sub_ == "cog"), ]
    s <- src_info(unique(lg$url))
    list(kind = "lga", status = row$status, built = row$when, n = nrow(s),
         released = if (nrow(s)) max(s$released, na.rm = TRUE) else NA, zips = s)
  } else {
    s <- src_info(row$url)
    list(kind = "list", status = row$status, built = row$when, n = 1L, released = s$released[1], zips = s)
  }
}

## ---- titles -------------------------------------------------------------------------
ACRONYMS <- c("LIST", "DEM", "CFEV", "TASVEG", "NCH", "ES", "EPA", "DHHS", "LGA", "CDC", "CDCS", "BRS", "AEP", "PCT",
              "SW", "NW", "CHM", "TFS", "UPSS", "DGVS", "NVA", "TWWHA", "MRT", "SES", "FT", "PWS", "DPAC", "RFA",
              "CAR", "IPA", "LUPAA", "HMS", "UFI", "PID", "TASWATER", "TAS", "LIDAR", "SAP", "NRM", "GBR", "WHA",
              "CFT", "TSFM", "BOM", "ABS", "OSM", "TFGA", "TPC", "CMA")
title_of <- function(code) {
  w <- strsplit(gsub("[-_]+", " ", code), " ")[[1]]
  w <- ifelse(toupper(w) %in% ACRONYMS | grepl("^[0-9]", w), toupper(w),
              paste0(substr(w, 1, 1), tolower(substr(w, 2, nchar(w)))))
  w <- sub("^([0-9]+)M$", "\\1 m", w)                                  # 10M -> 10 m
  paste(w, collapse = " ")
}

## ---- bbox in MGA55 for the locator map -------------------------------------------------
to_mga <- function(bbox, crs) {
  if (is.null(bbox) || anyNA(bbox) || is.na(crs)) return(NULL)
  if (length(bbox) == 6) bbox <- bbox[c(1, 2, 4, 5)]               # 3D bbox: xmin ymin zmin xmax ymax zmax
  if (startsWith(crs, "EPSG:28355")) return(round(bbox))
  tr <- tryCatch(proj_trans_create(crs, "EPSG:28355"), error = function(e) NULL)
  if (is.null(tr)) return(NULL)
  xy <- wk_coords(wk_transform(xy(c(bbox[1], bbox[3], bbox[1], bbox[3]), c(bbox[2], bbox[2], bbox[4], bbox[4])), tr))
  if (!all(is.finite(c(xy$x, xy$y)))) return(NULL)
  round(c(min(xy$x), min(xy$y), max(xy$x), max(xy$y)))
}

## ---- items ------------------------------------------------------------------------------
items <- lapply(seq_len(nrow(ls)), function(i) {
  p <- ls$path[i]; f <- ls$filename[i]; prod <- ls$prod[i]
  code <- if (!is.na(pname[prod])) unname(pname[prod]) else toupper(prod)
  file_stem <- sub("\\.(parquet|tif)$", "", basename(p))
  layer <- if (file_stem %in% c(paste0(prod, "_statewide"), prod)) NULL else sub("_statewide$", "", file_stem)
  it <- list(path = p, product = code, title = if (prod == "municipality") "LGA boundaries (municipalities)" else title_of(code),
             layer = layer, bytes = ls$size[i],
             kind = c(geoparquet = "vector", parquet = "table", cog = "raster")[[ls$sub[i]]])
  if (ls$sub[i] != "cog") {
    it$rows <- nrows$num_rows[match(f, nrows$file_name)]
    it$columns <- columns[[f]]
    g <- geo$v[match(f, geo$file_name)]
    if (!is.na(g)) {
      g <- fromJSON(g); gc <- g$columns[[g$primary_column]]
      it$geometry <- paste(gc$geometry_types, collapse = "/")
      id <- gc$crs$id
      it$crs <- if (!is.null(id)) paste0(id$authority, ":", id$code) else if (is.null(gc$crs)) "OGC:CRS84" else gc$crs$name
      if (grepl("MGA zone 55 \\+ AHD", it$crs)) it$crs <- "EPSG:28355+5711"
      it$bbox <- gc$bbox
      ## no CRS in the file means CRS84 to a reader; say so when the coordinates are plainly not lon/lat
      if (is.null(gc$crs) && length(gc$bbox) && max(abs(unlist(gc$bbox))) > 360) {
        it$crs <- NA_character_
        it$crs_note <- "CRS missing from the file (GeoParquet readers will assume lon/lat); the coordinates are MGA zone 55 (EPSG:28355)"
        it$bbox_mga <- round(unlist(gc$bbox)[c(1, 2, length(gc$bbox) / 2 + 1, length(gc$bbox) / 2 + 2)])
      }
    }
  } else {
    r <- rinfo[[p]]
    if (!is.null(r)) { it$raster <- r[c("dim", "bands", "res", "dtype", "nodata")]; it$crs <- r$crs; it$bbox <- r$bbox }
  }
  if (is.null(it$bbox_mga)) it$bbox_mga <- to_mga(it$bbox, it$crs)
  it$source <- provenance(p)
  it
})
message("crs: ", paste(names(table(vapply(items, function(x) x$crs %||% "none", ""))), table(vapply(items, function(x) x$crs %||% "none", "")), collapse = ", "))

## ---- Tasmania outline (km, y up -> negated for SVG) ------------------------------------------
v <- new(GDALVector, paste0("/vsicurl/", PUBLIC, "/geoparquet/municipality/statewide/municipality_statewide.parquet"))
v$returnGeomAs <- "WKB"; d <- v$fetch(-1); v$close()
tas <- geos_unary_union(geos_make_collection(geos_read_wkb(d$geometry)))
tas <- geos_intersection(tas, geos_create_rectangle(150000, 5050000, 700000, 5750000))   # drop Macquarie Island
tas <- geos_simplify_preserve_topology(tas, 800)
polys <- geos_unnest(tas, keep_multi = FALSE)
polys <- polys[geos_area(polys) > 5e6]                                                     # islands > 5 km2
ring_path <- function(g) {
  rings <- wk_coords(as_wkb(g))
  paste(vapply(split(rings, rings$ring_id), function(r) {
    paste0("M", paste(sprintf("%.1f %.1f", r$x / 1000, -r$y / 1000), collapse = "L"), "Z") }, ""), collapse = "")
}
outline <- paste(vapply(seq_along(polys), function(i) ring_path(polys[i]), ""), collapse = "")
ob <- round(unclass(wk_bbox(as_wkb(tas))) |> unlist() / 1000)

cat_json <- list(generated = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
                 https = PUBLIC, s3 = S3, outline = outline,
                 outline_bbox = unname(ob[c("xmin", "ymin", "xmax", "ymax")]), items = items)
dir.create(dirname(OUT), showWarnings = FALSE, recursive = TRUE)
writeLines(toJSON(cat_json, auto_unbox = TRUE, null = "null", na = "null", digits = NA, dataframe = "rows"), OUT)
message("wrote ", OUT, " (", length(items), " items, ", round(file.size(OUT) / 1024), " KiB)")

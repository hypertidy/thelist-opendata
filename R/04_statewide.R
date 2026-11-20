#!/usr/bin/env Rscript
## 04_statewide.R
## One statewide layer for every product LIST ships only as per-LGA zips, put
## in the mirror where a LIST statewide file would be:
##
##   geoparquet/<product>/statewide/<layer>_statewide.parquet
##   cog/<product>/statewide/<name>_statewide.tif
##
## so every product has a statewide/ file to read, however LIST ships it. A
## product that LIST also ships as STATEWIDE is left alone (its statewide file
## is LIST's own).
##
## Vectors. A feature that crosses an LGA boundary is *clipped* into each LGA
## file, and every piece keeps the feature's id and attributes; a feature lying
## along a boundary (boundary segments, some hydlines and rivers, a few
## transport nodes) ships whole in both LGAs. Here each id becomes one row
## again: attributes from the pieces (identical across pieces, checked over the
## 2026-09 snapshot), geometry rejoined, and SHAPE_Length / SHAPE_Area
## recomputed for rejoined rows. Rejoin by family:
##   polygons  union of the pieces (pieces share their cut edge exactly)
##   lines     distinct parts, then a directed line merge (no reversal, no overlay)
##   points    distinct points
## `lga` is added: the source LGA, or every source LGA ";"-separated for a
## rejoined row. A layer with no usable feature id (TASVEG 4.0 and its fire
## attributes) is stacked as it is, with `lga`: features crossing an LGA
## boundary stay in pieces there.
##
## Rasters (DEM 25 m): the LGA COGs share one grid; mosaicked (each tile's own
## nodata honoured, -9999 out) and written as one COG.
##
## A layer is only built when every expected LGA file is present (expected =
## the LGA zips that carry the layer, from manifest/layers.csv).
##
## Sources: each LGA file from DEST when it is there (converted this run),
## otherwise from the public store. Logged to manifest/converted.csv with url
## "lga-union:<product>/<layer>" and etag = md5 of the LGA source etags, so a
## re-run rebuilds a layer only when one of its LGA sources changed.
##
## Environment:
##   DEST     GDAL path for output (default: out); local DEST is also read first
##   PUBLIC   the store over HTTP (default: https://data.source.coop/mdsumner/thelist-opendata)
##   PRODUCT  regex on product slug, e.g. '^list_parcels$' (case ignored)
##   DRY=1    report what would be built, write nothing

suppressPackageStartupMessages({ library(duckdb); library(geos); library(wk); library(jsonlite) })

DEST    <- Sys.getenv("DEST", "out")
PUBLIC  <- Sys.getenv("PUBLIC", "https://data.source.coop/mdsumner/thelist-opendata")
PRODUCT <- Sys.getenv("PRODUCT", "")
DRY     <- Sys.getenv("DRY", "0") == "1"

Sys.setenv(GDAL_DISABLE_READDIR_ON_OPEN = "EMPTY_DIR", GDAL_HTTP_MAX_RETRY = "5", GDAL_HTTP_RETRY_DELAY = "5",
           GDAL_NUM_THREADS = "ALL_CPUS", GDAL_HTTP_USERAGENT = "thelist-opendata statewide")

## feature id per layer: LIST_GUID where the layer has it, else these
ID_COLS <- c(wedgetailed_eagle_nesting_habitat_low = "ID", wedgetailed_eagle_nesting_habitat_high = "ID",
             list_cfev_rivers = "RS_ID", list_cfev_wetlands = "WL_ID")

slug <- function(x) tolower(gsub("[^A-Za-z0-9]+", "_", sub("\\.[^.]+$", "", x)))
local_dest <- !grepl("^/vsi", DEST)
ensure_dir <- function(out) { if (local_dest && !DRY) dir.create(dirname(out), recursive = TRUE, showWarnings = FALSE); out }
run <- function(cmd, args) {
  message(cmd, " ", paste(args, collapse = " "))
  if (DRY) return(0L)
  err <- tempfile(); rc <- system2(cmd, args, stdout = FALSE, stderr = err)
  if (rc != 0L) { msg <- tail(readLines(err, warn = FALSE), 3); message(paste(msg, collapse = "\n")); attr(rc, "err") <- paste(msg, collapse = " | ") }
  unlink(err); rc
}
md5 <- function(x) { f <- tempfile(); writeLines(x, f); on.exit(unlink(f)); unname(tools::md5sum(f)) }
q <- function(x) paste0('"', gsub('"', '""', x), '"')          # SQL identifier

## ---- what is split, and where each LGA file is --------------------------------
logf <- "manifest/converted.csv"
if (!file.exists(logf)) download.file(paste0(PUBLIC, "/", logf), logf, quiet = TRUE)
done <- read.csv(logf, colClasses = "character")
layers <- read.csv("manifest/layers.csv", stringsAsFactors = FALSE)
lgas <- unique(layers$region[layers$region_type == "lga"])

out_ok <- done[startsWith(done$status, "ok") & !startsWith(done$url, "lga-union:") &
               grepl("^out/(geoparquet|cog)/[^/]+/[^/]+/[^/]+$", done$output), ]
out_ok$sub    <- sub("^out/([^/]+)/.*", "\\1", out_ok$output)
out_ok$prod   <- sub("^out/[^/]+/([^/]+)/.*", "\\1", out_ok$output)
out_ok$region <- sub("^out/[^/]+/[^/]+/([^/]+)/.*", "\\1", out_ok$output)
has_statewide <- unique(out_ok$prod[out_ok$region == "statewide"])
split <- out_ok[out_ok$region %in% slug(lgas) & !out_ok$prod %in% has_statewide, ]
## <stem>_<region>.<ext> is the standard name; anything else (a stray *.gdb.parquet) is not a layer file
split$stem <- mapply(function(f, r) sub(paste0("_", r, "\\.(parquet|tif)$"), "", f), basename(split$output), split$region)
split <- split[split$stem != basename(split$output), ]
split$key <- paste(split$sub, split$prod, split$stem, sep = "/")
if (nzchar(PRODUCT)) split <- split[grepl(PRODUCT, split$prod, ignore.case = TRUE), ]

## expected LGAs per (product, layer): the LGA zips whose peek found the layer with features
strip_region <- function(layer, region) mapply(function(l, r) sub(paste0("_", tolower(r), "$"), "", tolower(l)), layer, region, USE.NAMES = FALSE)
lay <- layers[layers$region_type == "lga" & layers$error == "" &
              (layers$geom_type == "raster" | (!is.na(layers$feature_count) & layers$feature_count > 0)), ]
is_muni <- grepl("^municipality_", lay$layer, ignore.case = TRUE)
lay$prod <- ifelse(is_muni, "municipality", slug(lay$product))
lay$stem <- slug(strip_region(lay$layer, lay$region))
lay$stem[lay$geom_type == "raster"] <- NA                       # raster stems come from the member name; match on product only
expected <- function(prod, stem, sub) {
  e <- if (sub == "cog") lay$region[lay$prod == prod & lay$geom_type == "raster"]
       else lay$region[lay$prod == prod & lay$stem %in% stem & lay$geom_type != "raster"]
  sort(unique(slug(e)))
}

## where to read each LGA file: DEST if it holds it, else the public store
src_path <- function(output) {
  rel <- sub("^out/", "", output)
  loc <- file.path(DEST, rel)
  if (local_dest && file.exists(loc)) return(normalizePath(loc))
  paste0(PUBLIC, "/", rel)
}
exists_remote <- function(u) {
  h <- suppressWarnings(system2("curl", c("-sfI", "-o", "/dev/null", "-w", "%{http_code}", shQuote(u)), stdout = TRUE))
  identical(h, "200")
}

log_done <- function(url, etag, out, status) {
  if (DRY) return(invisible())
  done <<- rbind(done[done$output != out, ],
                 data.frame(url = url, etag = etag, output = out, status = status,
                            when = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")))
  write.csv(done, logf, row.names = FALSE)
}

con <- dbConnect(duckdb(shared_home = FALSE))
## geometry stays plain WKB (BLOB) end to end: R returns WKB, and GDAL writes the GeoParquet metadata
invisible(dbExecute(con, "INSTALL httpfs; LOAD httpfs; SET enable_geoparquet_conversion = false;"))

## ---- geometry rejoin ------------------------------------------------------------
## pieces: data.frame(id, geometry = list of WKB), ordered by id, already distinct per id
rejoin <- function(pieces, family) {
  g  <- geos_read_wkb(pieces$geometry)
  id <- match(pieces$id, unique(pieces$id))
  u  <- geos_unnest(g, keep_multi = FALSE, keep_empty = FALSE)
  uid <- rep(id, attr(u, "lengths"))
  ## a part can ship in two pieces (a boundary line in both LGAs, sometimes
  ## reversed in one of them): keep it once, compared in normalised form, in
  ## the orientation of the first LGA that has it
  keep <- !duplicated(data.frame(uid, w = geos_write_hex(geos_normalize(u))))
  u <- u[keep]; uid <- uid[keep]
  type <- switch(family, polygon = "multipolygon", line = "multilinestring", point = "multipoint")
  coll <- geos_make_collection(u, type, feature_id = uid)
  fallback <- 0L
  res <- switch(family,
    polygon = tryCatch(geos_unary_union(coll), error = function(e) {
      ## a TopologyException on one group: do them one by one, make_valid first, pieces kept as a last resort
      vapply_geos <- lapply(seq_along(coll), function(i) tryCatch(geos_unary_union(coll[i]), error = function(e)
        tryCatch(geos_unary_union(geos_make_valid(coll[i])), error = function(e) { fallback <<- fallback + 1L; coll[i] })))
      do.call(c, vapply_geos) }),
    line  = geos_line_merge_directed(coll),
    point = coll)
  list(geometry = res, fallback = fallback)
}
family_of <- function(geom_type) {
  if (grepl("polygon", geom_type, ignore.case = TRUE)) "polygon"
  else if (grepl("line", geom_type, ignore.case = TRUE)) "line"
  else if (grepl("point", geom_type, ignore.case = TRUE)) "point" else NA
}

## ---- one vector layer -----------------------------------------------------------
build_vector <- function(s, out, etag) {
  srcs <- vapply(s$output, src_path, "")
  lga_of <- setNames(s$region, srcs)
  list_sql <- paste0("[", paste0("'", srcs, "'", collapse = ", "), "]")
  ## geometry type and CRS from the first file's GeoParquet metadata
  geo <- fromJSON(dbGetQuery(con, sprintf("SELECT decode(value) v FROM parquet_kv_metadata('%s') WHERE decode(key) = 'geo'", srcs[1]))$v)
  gcol <- geo$columns[[geo$primary_column]]
  gtype <- gcol$geometry_types[1]
  crs <- gcol$crs$id; crs <- if (!is.null(crs)) paste0(crs$authority, ":", crs$code) else stop("no CRS id in ", srcs[1])
  family <- family_of(gtype)
  invisible(dbExecute(con, "DROP TABLE IF EXISTS t; DROP TABLE IF EXISTS m; DROP TABLE IF EXISTS lg;"))
  map <- data.frame(filename = srcs, lga = unname(lga_of)); duckdb_register(con, "fmap", map, overwrite = TRUE)
  invisible(dbExecute(con, sprintf("CREATE TEMP TABLE t AS SELECT p.* EXCLUDE (filename, geometry_bbox), f.lga
                                    FROM read_parquet(%s, filename = true) p JOIN fmap f USING (filename)", list_sql)))
  cols <- dbGetQuery(con, "DESCRIBE t")$column_name
  n_in <- dbGetQuery(con, "SELECT count(*) n FROM t")$n
  idc <- if ("LIST_GUID" %in% cols) "LIST_GUID" else unname(ID_COLS[s$prod[1]])
  ## a usable id: present, never NULL, unique within each LGA file
  if (!is.na(idc) && idc %in% cols) {
    bad <- dbGetQuery(con, sprintf("SELECT (SELECT count(*) FROM t WHERE %1$s IS NULL) nul,
                                    (SELECT count(*) FROM (SELECT lga, %1$s FROM t GROUP BY ALL HAVING count(*) > 1)) dup", q(idc)))
    if (bad$nul > 0 || bad$dup > 0) { message("  ", idc, " not a feature id here (", bad$nul, " null, ", bad$dup, " repeated within an LGA): stacking"); idc <- NA }
  } else idc <- NA
  stats <- list(n_in = n_in, rejoined = 0L, pieces = 0L, multipart = 0L, fallback = 0L)
  tmp <- tempfile(fileext = ".parquet")
  if (is.na(idc) || is.na(family)) {
    invisible(dbExecute(con, sprintf("COPY t TO '%s' (FORMAT parquet, COMPRESSION zstd)", tmp)))
  } else {
    I <- q(idc)
    invisible(dbExecute(con, sprintf("CREATE TEMP TABLE m AS SELECT %1$s FROM t GROUP BY %1$s HAVING count(*) > 1", I)))
    invisible(dbExecute(con, sprintf("CREATE TEMP TABLE lg AS SELECT %1$s, string_agg(DISTINCT lga, ';' ORDER BY lga) lga
                                      FROM t SEMI JOIN m USING (%1$s) GROUP BY %1$s", I)))
    pieces <- dbGetQuery(con, sprintf("SELECT %1$s AS id, geometry, min(lga) first_lga FROM t SEMI JOIN m USING (%1$s)
                                       GROUP BY ALL ORDER BY id, first_lga", I))
    stats$pieces <- nrow(pieces)
    has_len <- "SHAPE_Length" %in% cols; has_area <- "SHAPE_Area" %in% cols
    if (nrow(pieces)) {
      rj <- rejoin(pieces, family)
      ids <- unique(pieces$id)
      r <- data.frame(id = ids)
      names(r) <- idc
      r$geometry <- blob::as_blob(unclass(geos_write_wkb(rj$geometry)))
      if (has_len)  r$SHAPE_Length <- geos_length(rj$geometry)
      if (has_area) r$SHAPE_Area   <- geos_area(rj$geometry)
      stats$rejoined <- length(ids); stats$fallback <- rj$fallback
      stats$multipart <- sum(geos_num_geometries(rj$geometry) > 1)
    } else {
      r <- dbGetQuery(con, sprintf("SELECT %s, geometry FROM t LIMIT 0", I))
    }
    duckdb_register(con, "r", r, overwrite = TRUE)
    rexcl <- paste(c("geometry", "lga", if (has_len) "SHAPE_Length", if (has_area) "SHAPE_Area"), collapse = ", ")
    rcols <- paste(c("r.geometry", if (has_len) "r.SHAPE_Length", if (has_area) "r.SHAPE_Area"), collapse = ", ")
    invisible(dbExecute(con, sprintf("COPY (
        SELECT * FROM t ANTI JOIN m USING (%1$s)
        UNION ALL BY NAME
        SELECT a.* EXCLUDE (%2$s), lg.lga, %3$s
        FROM (SELECT DISTINCT ON (%1$s) * FROM t SEMI JOIN m USING (%1$s) ORDER BY %1$s, lga) a
        JOIN lg USING (%1$s) JOIN r USING (%1$s)
      ) TO '%4$s' (FORMAT parquet, COMPRESSION zstd)", I, rexcl, rcols, tmp)))
  }
  n_out <- dbGetQuery(con, sprintf("SELECT count(*) n FROM read_parquet('%s')", tmp))$n
  ## same writer settings as 03_convert.R; the DuckDB file has a plain WKB column named geometry
  rc <- run("gdal", c("vector", "pipeline", paste(
    "read", shQuote(tmp),
    "! set-geom-type --geometry-type", toupper(sub("^(Multi)?", "Multi", gtype)),
    "! edit --crs", crs,
    "! write --of Parquet --overwrite --lco COMPRESSION=ZSTD --lco ROW_GROUP_SIZE=65536",
    "--lco GEOMETRY_ENCODING=WKB --lco WRITE_COVERING_BBOX=YES --lco SORT_BY_BBOX=YES --lco GEOMETRY_NAME=geometry",
    "--output-layer", shQuote(basename(sub("\\.parquet$", "", out))), shQuote(out))))
  unlink(tmp)
  msg <- sprintf("%d rows from %d LGA files -> %d; id %s; %d ids rejoined from %d pieces (%d still multi-part%s)",
                 stats$n_in, nrow(s), n_out, if (is.na(idc)) "none (stacked)" else idc, stats$rejoined, stats$pieces,
                 stats$multipart, if (stats$fallback) sprintf(", %d union fallbacks", stats$fallback) else "")
  message("  ", msg)
  if (rc == 0L) paste0("ok (", nrow(s), " LGA: ", msg, ")") else paste0("gdal vector rc ", rc, ": ", attr(rc, "err"))
}

## ---- one raster layer -----------------------------------------------------------
build_raster <- function(s, out, etag) {
  srcs <- vapply(s$output, function(o) { p <- src_path(o); if (startsWith(p, "http")) paste0("/vsicurl/", p) else p }, "")
  vrt <- tempfile(fileext = ".vrt")
  rc <- run("gdal", c("raster", "mosaic", "--overwrite", "--dst-nodata", "-9999", "--of", "VRT", shQuote(srcs), shQuote(vrt)))
  ## the DEM tiles carry an unnamed ESRI WKT that is MGA zone 55: label it so (no reprojection), as 03_convert.R does
  wkt <- if (rc == 0L) { r <- new(gdalraster::GDALRaster, vrt); on.exit(r$close()); r$getProjection() } else ""
  crs <- if (nzchar(wkt) && gdalraster::srs_is_same(wkt, gdalraster::srs_to_wkt("EPSG:28355"))) "! edit --crs EPSG:28355" else ""
  ## OVERVIEWS=IGNORE_EXISTING: the mosaic VRT would otherwise pass through the tiles' single overview level
  if (rc == 0L) rc <- run("gdal", c("raster", "pipeline", paste("read", shQuote(vrt), crs,
                                    "! write --of COG --overwrite --co COMPRESS=ZSTD --co BLOCKSIZE=512 --co OVERVIEWS=IGNORE_EXISTING",
                                    "--co NUM_THREADS=ALL_CPUS --co BIGTIFF=IF_SAFER --co PREDICTOR=YES", shQuote(out))))
  unlink(vrt)
  if (rc == 0L) paste0("ok (mosaic of ", nrow(s), " LGA COGs)") else paste0("gdal raster rc ", rc, ": ", attr(rc, "err"))
}

## ---- build -------------------------------------------------------------------
keys <- unique(split$key)
message(length(keys), " LGA-split layers")
for (key in keys) {
  s <- split[split$key == key, ]; s <- s[order(s$region), ]
  s <- s[!duplicated(s$output, fromLast = TRUE), ]
  sub <- s$sub[1]; prod <- s$prod[1]; stem <- s$stem[1]
  ext <- if (sub == "cog") ".tif" else ".parquet"
  rel <- file.path(sub, prod, "statewide", paste0(stem, "_statewide", ext))
  out <- ensure_dir(file.path(DEST, rel)); logged <- file.path("out", rel)
  message(key)
  url <- paste0("lga-union:", prod, "/", stem)
  etag <- md5(sort(paste(s$region, s$etag)))
  if (any(done$output == logged & done$etag == etag & startsWith(done$status, "ok"))) { message("  unchanged"); next }
  want <- expected(prod, stem, sub); have <- s$region
  ## a file the log calls ok but the store does not hold is missing too
  gone <- s$region[!vapply(s$output, function(o) { p <- src_path(o); !startsWith(p, "http") || exists_remote(p) }, TRUE)]
  missing <- union(setdiff(want, have), gone)
  if (length(missing)) { message("  skipped, LGA files missing: ", paste(missing, collapse = ", ")); next }
  if (DRY) { message("  would build ", out, " from ", nrow(s), " LGA files"); next }
  status <- tryCatch(if (sub == "cog") build_raster(s, out, etag) else build_vector(s, out, etag),
                     error = function(e) paste("R error:", conditionMessage(e)))
  if (!startsWith(status, "ok")) message("  FAILED: ", status)
  log_done(url, etag, logged, status)
}
dbDisconnect(con, shutdown = TRUE)

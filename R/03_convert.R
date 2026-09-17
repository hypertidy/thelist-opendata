#!/usr/bin/env Rscript
## 03_convert.R
## manifest/layers.csv (+ files.csv) -> DEST, laid out as:
##
##   raw/<zipname>.zip                             bit-for-bit copy of the source zip
##   raw/<loose files>                             the loose top-level shp/tab/gdb components
##   geoparquet/<product>/<region>/<layer>.parquet one GeoParquet per vector layer
##   geoparquet/<product>/<layer>_union.vrt        OGR union over the LGA files of a split product
##   parquet/<product>/<region>/<table>.parquet    attribute-only tables (geom_type None)
##   cog/<product>/<region>/<name>.tif             rasters (tif/asc members, raster FileGDBs) as COG
##
## Source preference per (product, region, layer): gdb > shp > tab, skipping a
## source whose peek errored or reported 0 features (LAND_USE_2013 Glamorgan
## has a 0-feature gdb beside a 9900-feature shp; a dozen zips have an empty
## gdb beside a full shp).
##
## Uses the unified 'gdal' CLI (GDAL >= 3.11): gdal vector pipeline, gdal raster
## pipeline / convert, gdal vsi copy. Everything streams from the public URL via /vsizip//vsicurl/ unless
## SRC_ROOT points at a local mirror of opendata/data/ (bowerbird), in which
## case /vsizip/ reads local files. The rasters the peek skipped as too big
## (CHM and Slope 2 m, 8-24 GB zips) are only converted from SRC_ROOT.
##
## Environment:
##   DEST       GDAL path for output, e.g. /vsis3/bucket/thelist  (default: out)
##   SRC_ROOT   local mirror dir (default: read from URL)
##   PRODUCT    regex on product to restrict the run, e.g. '^LIST_(PARCELS|ADDRESS)'
##   RAW=0      skip the raw copy
##   DRY=1      print commands only
##   CORES=4    parallel gdal jobs
## Progress goes to manifest/converted.csv keyed by source url + etag + output;
## anything already logged with the same etag is skipped, so re-runs only do
## what changed upstream.

suppressPackageStartupMessages(library(parallel))

DEST <- Sys.getenv("DEST", "out")
SRC_ROOT <- Sys.getenv("SRC_ROOT", "")
DRY <- Sys.getenv("DRY", "0") == "1"
RAW <- Sys.getenv("RAW", "1") != "0"
PRODUCT <- Sys.getenv("PRODUCT", "")
CORES <- as.integer(Sys.getenv("CORES", "4"))

Sys.setenv(GDAL_DISABLE_READDIR_ON_OPEN = "EMPTY_DIR",
           GDAL_HTTP_MULTIRANGE = "YES", GDAL_HTTP_MERGE_CONSECUTIVE_RANGES = "YES",
           CPL_VSIL_CURL_CHUNK_SIZE = "10485760",           # whole members are read here, not headers (10 MiB is the cap)
           GDAL_HTTP_MAX_RETRY = "5", GDAL_HTTP_RETRY_DELAY = "5",
           GDAL_HTTP_CONNECTTIMEOUT = "20", GDAL_HTTP_TIMEOUT = "600",
           VSI_CACHE = "TRUE", VSI_CACHE_SIZE = "268435456",
           GDAL_NUM_THREADS = "ALL_CPUS", OGR_ORGANIZE_POLYGONS = "ONLY_CCW",
           GDAL_HTTP_USERAGENT = "thelist-opendata convert")

files <- read.csv("manifest/files.csv", stringsAsFactors = FALSE)
layers <- read.csv("manifest/layers.csv", stringsAsFactors = FALSE)
if (nzchar(PRODUCT)) layers <- layers[grepl(PRODUCT, layers$product), ]
etag <- setNames(files$etag, files$url)

logf <- "manifest/converted.csv"
done <- if (file.exists(logf)) read.csv(logf, stringsAsFactors = FALSE) else
  data.frame(url = character(), etag = character(), output = character(), status = character(), when = character())
is_done <- function(url, out) { et <- unname(etag[url]); !is.na(et) && any(done$url == url & done$output == out & done$etag == et & startsWith(done$status, "ok")) }
log_done <- function(url, out, status) {
  if (DRY) return(invisible())
  et <- unname(etag[url]); if (is.null(et) || is.na(et)) et <- ""
  done <<- rbind(done[done$output != out, ],                       # one row per output: latest status wins
                 data.frame(url = url, etag = et, output = out, status = status,
                            when = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")))
  write.csv(done, logf, row.names = FALSE)
}

slug <- function(x) tolower(gsub("[^A-Za-z0-9]+", "_", sub("\\.[^.]+$", "", x)))
local_or_url <- function(url) if (nzchar(SRC_ROOT)) file.path(SRC_ROOT, basename(url)) else paste0("/vsicurl/", url)
src_dsn <- function(url, member) {
  base <- paste0("/vsizip/", local_or_url(url))
  if (is.na(member) || member == "") base else file.path(base, member)
}
## a local DEST needs its directories made; a /vsi* DEST (object store) does not
ensure_dir <- function(out) { if (!grepl("^/vsi", out) && !DRY) dir.create(dirname(out), recursive = TRUE, showWarnings = FALSE); out }
has <- function(x) !is.null(x) && length(x) == 1 && !is.na(x) && nzchar(x)
## a dsn from the peek is only usable if it is a GDAL path (a bare URL or a
## stray value means the peek row is stale): otherwise build it from url + member
usable_dsn <- function(x) has(x) && grepl("^(/vsi|OpenFileGDB:)", x)
safe_job <- function(f) function(i) tryCatch(f(i), error = function(e)
  data.frame(url = NA_character_, out = NA_character_, status = paste("R error:", conditionMessage(e))))
## returns the exit code; on failure the tail of stderr is kept in attr(, "err")
run <- function(cmd, args) {
  message(cmd, " ", paste(args, collapse = " "))
  if (DRY) return(0L)
  err <- tempfile(); rc <- system2(cmd, args, stdout = FALSE, stderr = err)
  if (rc != 0L) { msg <- tail(readLines(err, warn = FALSE), 3); message(paste(msg, collapse = "\n"))
  attr(rc, "err") <- paste(msg, collapse = " | ") }
  unlink(err); rc
}
status_of <- function(rc, what) if (rc == 0L) "ok" else paste0(what, " rc ", rc, ": ", attr(rc, "err"))

## ---- CRS policy -----------------------------------------------------------
## Native CRS is kept. The only intervention: an unidentified ESRI WKT that
## names MGA zone 55 and whose extent sits inside MGA55 gets EPSG:28355
## assigned (-a_srs, no reprojection); a compound one with AHD gets 28355+5711.
mga55_extent <- function(ext) {
  e <- suppressWarnings(as.numeric(strsplit(ext, " ")[[1]]))
  length(e) >= 4 && !anyNA(e[1:4]) && e[1] > 150000 && e[3] < 750000 && e[2] > 5000000 && e[4] < 5800000
}
assign_crs <- function(crs, ext) {
  if (crs == "" || grepl("^EPSG:", crs)) return("")
  if (grepl("AHD", crs) && mga55_extent(ext)) return("EPSG:28355+5711")
  if (grepl("GDA.?(19)?94|MGA|Zone.?55|Transverse_Mercator", crs, ignore.case = TRUE) && mga55_extent(ext))
    return("EPSG:28355")
  ""
}
## pipeline steps are joined with " ! "
pipe <- function(...) paste(c(...), collapse = " ! ")
## GeoParquet has no M ordinate: drop it (keep Z) for ZM / M geometries
geom_step <- function(geom_type) paste("set-geom-type --multi --linear",
                                       if (grepl("ZM$", geom_type)) "--dim XYZ" else if (grepl("[^Z]M$", geom_type)) "--dim XY" else "")

## ---- pick one source per (product, region, layer) -------------------------
vec <- layers[layers$geom_type != "raster" & layers$error == "" & !is.na(layers$feature_count), ]
vec <- vec[vec$feature_count > 0 | vec$format == "gdb", ]     # tables with 0 rows in gdb still convert
pref <- c(gdb = 1, gpkg = 2, shp = 3, tab = 4, mif = 5, geojson = 6, kml = 7, gml = 8)
vec$rank <- pref[vec$format] + ifelse(vec$feature_count == 0, 10, 0)   # 0-feature gdb ranks below a full shp
## every LGA zip ships the LGA boundary as municipality_<lga>: 1277 copies of 29
## polygons. Make it one product, converted once per LGA from the first zip seen.
is_muni <- grepl("^municipality_", vec$layer, ignore.case = TRUE)
vec$product[is_muni] <- "MUNICIPALITY"
vec <- vec[order(vec$product, vec$region, tolower(vec$layer), vec$rank, vec$url), ]
vec <- vec[!duplicated(vec[, c("product", "region", "layer")]), ]
message(nrow(vec), " vector layers selected; source formats: ", paste(names(table(vec$format)), table(vec$format), collapse = ", "))

## ---- 1. raw archive ---------------------------------------------------------
if (RAW) {
  raw <- files[!files$is_dir & !grepl("\\.gdb/", files$path), ]      # zips and the loose top-level components
  if (nzchar(PRODUCT)) raw <- raw[grepl(PRODUCT, raw$product), ]
  for (i in seq_len(nrow(raw))) {
    u <- raw$url[i]; out <- ensure_dir(file.path(DEST, "raw", raw$path[i]))
    if (is_done(u, out)) next
    message("copy ", raw$path[i])
    ok <- run("gdal", c("vsi", "copy", shQuote(local_or_url(u)), shQuote(out))) == 0L
    log_done(u, out, if (ok) "ok" else "copy failed")
  }
}

## ---- 2. vector -> (Geo)Parquet ------------------------------------------------
vec_job <- function(i) {
  L <- vec[i, ]
  sub <- if (L$geom_type %in% c("None", "")) "parquet" else "geoparquet"
  out <- ensure_dir(file.path(DEST, sub, slug(L$product), slug(L$region), paste0(slug(L$layer), ".parquet")))
  if (is_done(L$url, out)) return(NULL)
  dsn <- if (usable_dsn(L$dsn) && !nzchar(SRC_ROOT)) L$dsn else src_dsn(L$url, L$member)
  crs <- assign_crs(L$crs, L$extent)
  steps <- pipe(paste("read --layer", shQuote(L$layer), shQuote(dsn)),
                if (sub == "geoparquet") geom_step(L$geom_type),
                if (nzchar(crs)) paste("edit --crs", crs),
                paste("write --of Parquet --overwrite",
                      "--lco COMPRESSION=ZSTD --lco ROW_GROUP_SIZE=65536",
                      "--lco GEOMETRY_ENCODING=WKB --lco WRITE_COVERING_BBOX=YES",
                      "--lco SORT_BY_BBOX=YES --lco GEOMETRY_NAME=geometry", shQuote(out)))
  rc <- run("gdal", c("vector", "pipeline", steps))
  ## Coded field domains become Arrow dictionary columns, which the Parquet writer
  ## cannot emit when a domain entry has a null description (LAND_USE_2019_BRS,
  ## POTENTIAL_AG_LAND). Bounce through FlatGeobuf, which drops domains but keeps
  ## field names, Int16/DateTime types and multi geometries.
  if (rc != 0L && grepl("DictionaryArray", attr(rc, "err"))) {
    fgb <- tempfile(fileext = ".fgb")
    rc <- run("gdal", c("vector", "pipeline", pipe(paste("read --layer", shQuote(L$layer), shQuote(dsn)),
                                                   if (sub == "geoparquet") geom_step(L$geom_type),
                                                   if (nzchar(crs)) paste("edit --crs", crs),
                                                   paste("write --of FlatGeobuf --overwrite", shQuote(fgb)))))
    if (rc == 0L) rc <- run("gdal", c("vector", "convert", "--of Parquet --overwrite",
                                      "--lco COMPRESSION=ZSTD --lco ROW_GROUP_SIZE=65536",
                                      "--lco GEOMETRY_ENCODING=WKB --lco WRITE_COVERING_BBOX=YES",
                                      "--lco SORT_BY_BBOX=YES --lco GEOMETRY_NAME=geometry",
                                      "--output-layer", shQuote(L$layer), shQuote(fgb), shQuote(out)))
    unlink(fgb)
    if (rc == 0L) return(data.frame(url = L$url, out = out, status = "ok (via FlatGeobuf: domain fields)"))
  }
  data.frame(url = L$url, out = out, status = status_of(rc, "gdal vector"))
}
res <- do.call(rbind, mclapply(seq_len(nrow(vec)), safe_job(vec_job), mc.cores = CORES))
for (i in seq_len(NROW(res))) if (!is.na(res$url[i])) log_done(res$url[i], res$out[i], res$status[i])
if (any(grepl("^R error", res$status))) message("R errors in vector jobs:\n", paste(unique(res$status[grepl("^R error", res$status)]), collapse = "\n"))

## ---- 3. union VRT per LGA-split product --------------------------------------
## Recipe, not payload: an OGR VRT unioning the per-LGA parquet files, with the
## source LGA as a field. Open it directly, or materialise:
##   gdal vector convert --of Parquet <layer>_union.vrt all.parquet
split <- vec[vec$region_type == "lga" & !vec$geom_type %in% c("None", ""), ]
strip_region <- function(layer, region) mapply(function(l, r) sub(paste0("_", tolower(r), "$"), "", tolower(l)), layer, region, USE.NAMES = FALSE)
split$key <- paste(split$product, strip_region(split$layer, split$region))
for (key in unique(split$key)) {
  s <- split[split$key == key, ]; s <- s[order(s$region), ]
  lname <- slug(strip_region(s$layer[1], s$region[1]))
  vrt <- ensure_dir(file.path(DEST, "geoparquet", slug(s$product[1]), paste0(lname, "_union.vrt")))
  xml <- c("<OGRVRTDataSource>",
           sprintf('  <OGRVRTUnionLayer name="%s">', lname),
           "    <PreserveSrcFID>OFF</PreserveSrcFID>",
           "    <SourceLayerFieldName>lga</SourceLayerFieldName>",
           "    <FieldStrategy>FirstLayer</FieldStrategy>",   # sources share one schema; keeps Int16/DateTime instead of String
           sprintf('    <OGRVRTLayer name="%s">\n      <SrcDataSource relativeToVRT="1">%s/%s.parquet</SrcDataSource>\n      <SrcLayer>%s</SrcLayer>\n    </OGRVRTLayer>',
                   slug(s$region), slug(s$region), slug(s$layer), slug(s$layer)),
           "  </OGRVRTUnionLayer>", "</OGRVRTDataSource>")
  message("vrt ", vrt)
  if (!DRY) { tmp <- tempfile(fileext = ".vrt"); writeLines(xml, tmp); run("gdal", c("vsi", "copy", shQuote(tmp), shQuote(vrt))) }
}

## ---- 4. raster -> COG ---------------------------------------------------------
ras <- layers[layers$geom_type == "raster", ]
ras <- ras[!duplicated(ras[, c("url", "member", "layer")]), ]
## the same raster can ship twice in one zip (DEM_25M: .asc and a raster gdb),
## which would map to one output path: keep one, gdb > tif > asc
sub_ds <- !is.na(ras$dsn) & grepl("^OpenFileGDB:", ras$dsn)
ras$stem <- slug(ifelse(sub_ds, sub("^.*:", "", ras$dsn), basename(ras$member)))
ras$rank <- match(ras$format, c("gdb", "tif", "tiff", "img", "asc", "jp2", "ecw"))
ras <- ras[order(ras$product, ras$region, ras$stem, ras$rank), ]
ras <- ras[!duplicated(ras[, c("product", "region", "stem")]), ]
ras_job <- function(i) {
  R <- ras[i, ]
  skipped <- grepl("^skipped", R$error)
  if (R$error != "" && !skipped) return(NULL)
  if (skipped && !nzchar(SRC_ROOT)) {
    message("needs local copy (SRC_ROOT): ", R$name, " / ", R$member); return(NULL)
  }
  nm <- if (usable_dsn(R$dsn) && grepl("^OpenFileGDB:", R$dsn)) sub("^.*:", "", R$dsn) else basename(R$member)
  out <- ensure_dir(file.path(DEST, "cog", slug(R$product), slug(R$region), paste0(slug(nm), ".tif")))
  if (is_done(R$url, out)) return(NULL)
  dsn <- if (usable_dsn(R$dsn) && !nzchar(SRC_ROOT)) R$dsn else src_dsn(R$url, R$member)
  ## predictor only pays for >= 16-bit and float data; sub-byte (NBITS < 8) rasters reject it.
  ## Byte rasters here are class grids (soil drainage 1..6 etc.): overviews must not
  ## interpolate between classes, so NEAREST; continuous data keeps the COG default.
  dtype <- sub("^.*band ", "", R$layer)
  co <- paste("--co COMPRESS=ZSTD --co BLOCKSIZE=512 --co OVERVIEWS=IGNORE_EXISTING",
              "--co NUM_THREADS=ALL_CPUS --co BIGTIFF=IF_SAFER",
              if (grepl("Int16|Int32|Int64|Float", dtype)) "--co PREDICTOR=YES" else "",
              if (grepl("^Byte", dtype)) "--co RESAMPLING=NEAREST --co OVERVIEW_RESAMPLING=NEAREST" else "")
  crs <- assign_crs(R$crs, R$extent)
  rc <- if (nzchar(crs))
    run("gdal", c("raster", "pipeline", pipe(paste("read", shQuote(dsn)), paste("edit --crs", crs),
                                             paste("write --of COG --overwrite", co, shQuote(out)))))
  else run("gdal", c("raster", "convert", "--of", "COG", "--overwrite", co, shQuote(dsn), shQuote(out)))
  data.frame(url = R$url, out = out, status = status_of(rc, "gdal raster"))
}
res <- do.call(rbind, mclapply(seq_len(nrow(ras)), safe_job(ras_job), mc.cores = max(1L, CORES %/% 2L)))
for (i in seq_len(NROW(res))) if (!is.na(res$url[i])) log_done(res$url[i], res$out[i], res$status[i])
if (any(grepl("^R error", res$status))) message("R errors in raster jobs:\n", paste(unique(res$status[grepl("^R error", res$status)]), collapse = "\n"))

## ---- 5. datasets exposed outside zips ------------------------------------------
## The two bare top-level gdbs, the gdbs inside the exposed subdirectories, and
## the loose top-level shapefile. Opened straight over /vsicurl/ (OpenFileGDB
## reads its tables by name, so EMPTY_DIR does not get in the way). Where a gdb
## and a shp sit side by side the gdb wins.
bare <- files[(files$is_dir & grepl("\\.gdb/$", files$path)) |
                (!files$is_dir & files$ext == "shp" & !grepl("/", files$path)), ]
bare$stem <- tolower(sub("\\.(gdb/|shp)$", "", basename(sub("/$", "", bare$path))))
bare <- bare[order(bare$stem, bare$ext != "dir"), ]
bare <- bare[!duplicated(bare$stem), ]
if (nzchar(PRODUCT)) bare <- bare[grepl(PRODUCT, bare$product), ]
for (i in seq_len(nrow(bare))) {
  u <- sub("/$", "", bare$url[i]); dsn <- paste0("/vsicurl/", u)
  region <- if (nzchar(bare$region[i])) slug(bare$region[i]) else "statewide"
  out <- ensure_dir(file.path(DEST, "geoparquet", slug(bare$product[i]), region, paste0(bare$stem[i], ".parquet")))
  if (is_done(bare$url[i], out)) next
  rc <- run("gdal", c("vector", "pipeline", pipe(paste("read", shQuote(dsn)), "set-geom-type --multi --linear",
                                                 paste("write --of Parquet --overwrite --lco COMPRESSION=ZSTD --lco ROW_GROUP_SIZE=65536",
                                                       "--lco WRITE_COVERING_BBOX=YES --lco SORT_BY_BBOX=YES", shQuote(out)))))
  log_done(bare$url[i], out, status_of(rc, "gdal vector"))
}
message("done; ", sum(startsWith(done$status, "ok")), " outputs ok, ", sum(!startsWith(done$status, "ok")), " not ok; log in ", logf)
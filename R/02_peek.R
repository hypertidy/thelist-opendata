#!/usr/bin/env Rscript
## 02_peek.R
## manifest/files.csv -> manifest/contents.csv (every member of every zip)
##                    -> manifest/layers.csv   (every layer of every zip)
## Nothing is downloaded: GDAL reads the zip central directory and dataset
## headers over HTTP range requests via /vsizip//vsicurl/.
##
## Needs: gdalraster (vsi_read_dir, vsi_stat), jsonlite, and ogrinfo/gdalinfo
## on PATH.
##
## Environment:
##   LIMIT=n          only the first n zips (testing)
##   CORES=8          parallel workers for the open pass (forked; not Windows)
##   TIMEOUT=120      seconds per ogrinfo/gdalinfo call
##   RASTER_MAX_ZIP=2 skip gdalinfo on raster members in zips bigger than this many GiB
##                    (a TIFF inside a deflated zip may need the whole member inflated
##                    to reach its IFDs; 24 GB of that is not a peek)
##   RELIST=1         redo the member listing even if contents.csv exists
##
## Both passes are resumable: contents.csv is reused unless RELIST=1, and the
## open pass appends per zip and skips zips already present in layers.csv.
## One datasource is opened per zip, not per member: the Shapefile driver
## reads a directory of .shp as one multi-layer datasource, so the zip root is
## opened once for all shapefiles; each .gdb is opened once; .tab is opened
## only when there is no .shp and no .gdb (in every zip seen so far tab is a
## duplicate of shp). Which formats a zip carries is recorded regardless.

suppressPackageStartupMessages({
  library(gdalraster)
  library(jsonlite)
  library(parallel)
})

`%||%` <- function(a, b) if (is.null(a)) b else a

## Inherited by the ogrinfo/gdalinfo children. EMPTY_DIR is the important one:
## without it every open of /vsicurl/.../X.zip fetches the 2000-row Apache
## index to enumerate sibling files. The vsizip layer is unaffected (its
## listing is the central directory, already in memory).
Sys.setenv(GDAL_DISABLE_READDIR_ON_OPEN = "EMPTY_DIR",
           GDAL_HTTP_MULTIRANGE = "YES",
           GDAL_HTTP_MERGE_CONSECUTIVE_RANGES = "YES",
           CPL_VSIL_CURL_CHUNK_SIZE = "1048576",   # first read grabs the tail of the zip; 1 MiB covers most central directories
           GDAL_HTTP_MAX_RETRY = "3",
           GDAL_HTTP_RETRY_DELAY = "2",
           GDAL_HTTP_CONNECTTIMEOUT = "20",
           GDAL_HTTP_TIMEOUT = "60",
           VSI_CACHE = "TRUE", VSI_CACHE_SIZE = "67108864",
           GDAL_HTTP_USERAGENT = "thelist-opendata peek",
           SHAPE_RESTORE_SHX = "NO")

CORES <- as.integer(Sys.getenv("CORES", "8"))
TIMEOUT <- as.integer(Sys.getenv("TIMEOUT", "120"))
RASTER_MAX_ZIP <- as.numeric(Sys.getenv("RASTER_MAX_ZIP", "2")) * 2^30
RELIST <- Sys.getenv("RELIST", "0") == "1"

files <- read.csv("manifest/files.csv", stringsAsFactors = FALSE)
zips <- files[files$ext == "zip", ]
lim <- as.integer(Sys.getenv("LIMIT", nrow(zips)))
zips <- zips[seq_len(min(lim, nrow(zips))), ]

vsi <- function(url) paste0("/vsizip//vsicurl/", url)

## ---- 1. members of every zip --------------------------------------------
list_members <- function(url) {
  root <- vsi(url)
  m <- tryCatch(vsi_read_dir(root, recursive = TRUE), error = function(e) character())
  if (!length(m)) return(data.frame(url = url, member = "", is_dir = NA, bytes = NA_real_,
                                    stringsAsFactors = FALSE))
  full <- file.path(root, m)
  data.frame(url = url, member = m,
             is_dir = vapply(full, function(p) isTRUE(vsi_stat(p, "type") == "dir"), logical(1)),
             bytes = vapply(full, function(p) as.numeric(vsi_stat(p, "size")), numeric(1)),
             stringsAsFactors = FALSE, row.names = NULL)
}

if (file.exists("manifest/contents.csv") && !RELIST) {
  contents <- read.csv("manifest/contents.csv", stringsAsFactors = FALSE)
  contents <- contents[contents$url %in% zips$url, ]
  todo <- zips[!zips$url %in% contents$url, ]
  message("contents.csv reused for ", length(unique(contents$url)), " zips; listing ", nrow(todo), " more")
} else {
  contents <- NULL; todo <- zips
}
if (nrow(todo)) {
  new <- do.call(rbind, mclapply(seq_len(nrow(todo)), function(i) {
    message(sprintf("[%d/%d] list %s", i, nrow(todo), todo$name[i]))
    list_members(todo$url[i])
  }, mc.cores = CORES))
  new$ext <- tolower(sub("^.*\\.", "", new$member))
  new$ext[!grepl("\\.", basename(new$member))] <- ""
  contents <- rbind(contents, new)
  write.csv(contents, "manifest/contents.csv", row.names = FALSE, na = "")
}
unlisted <- unique(contents$url[contents$member == ""])
if (length(unlisted)) message(length(unlisted), " zips could not be listed (see contents.csv rows with empty member)")

## ---- 2. one datasource per zip -------------------------------------------
VEC_EXT <- c("shp", "tab", "gpkg", "geojson", "mif", "kml", "gml")
RAS_EXT <- c("tif", "tiff", "asc", "img", "ecw", "jp2")
zip_bytes <- files$bytes[match(contents$url, files$url)]

plan_zip <- function(url) {
  m <- contents[contents$url == url & contents$member != "", ]
  if (!nrow(m)) return(NULL)
  ## directory members arrive as "name.gdb/" - strip the slash before any extension test
  m$member <- sub("/+$", "", m$member)
  m$ext <- tolower(sub("^.*\\.", "", basename(m$member)))
  m$ext[!grepl("\\.", basename(m$member))] <- ""
  is_gdb <- grepl("\\.gdb$", m$member, ignore.case = TRUE)
  formats <- sort(unique(c(m$ext[m$ext %in% c(VEC_EXT, RAS_EXT)], if (any(is_gdb)) "gdb",
                           if (any(m$ext %in% c("xls", "xlsx", "csv"))) "tables")))
  gdbs <- m$member[is_gdb]
  ## a FileGDB whose only tables are the system ones (a00000001..a00000008) has no
  ## user feature classes: mark it rather than try to open it
  gdb_empty <- vapply(gdbs, function(g)
    !any(grepl("/a0000000[9a-f]\\.gdbtable$|/a000000[1-9a-f][0-9a-f]\\.gdbtable$",
               m$member[startsWith(m$member, paste0(g, "/"))], ignore.case = TRUE)), logical(1))
  loose <- m[!grepl("\\.gdb/", m$member, ignore.case = TRUE), ]
  ## shapefiles: open the directory that holds them (usually the zip root)
  shp_dirs <- unique(dirname(loose$member[loose$ext == "shp"]))
  tabs <- if (!length(gdbs) && !length(shp_dirs)) loose$member[loose$ext == "tab"] else character()
  others <- loose$member[loose$ext %in% c("gpkg", "geojson", "mif", "kml", "gml")]
  ras <- loose$member[loose$ext %in% RAS_EXT]
  big <- isTRUE(files$bytes[match(url, files$url)] > RASTER_MAX_ZIP)
  rbind(
    if (length(gdbs)) data.frame(url = url, member = gdbs, kind = ifelse(gdb_empty, "gdb-empty", "vector"), formats = paste(formats, collapse = ";")),
    if (length(shp_dirs)) data.frame(url = url, member = ifelse(shp_dirs == ".", "", shp_dirs), kind = "vector", formats = paste(formats, collapse = ";")),
    if (length(c(tabs, others))) data.frame(url = url, member = c(tabs, others), kind = "vector", formats = paste(formats, collapse = ";")),
    if (length(ras)) data.frame(url = url, member = ras, kind = if (big) "raster-skip" else "raster", formats = paste(formats, collapse = ";"))
  )
}

run_json <- function(cmd, args) {
  out <- tryCatch(suppressWarnings(system2(cmd, args, stdout = TRUE, stderr = FALSE, timeout = TIMEOUT)),
                  error = function(e) character())
  if (!length(out)) return(NULL)
  tryCatch(fromJSON(paste(out, collapse = "\n"), simplifyVector = FALSE), error = function(e) NULL)
}
blank <- function(dsn, kind, err) data.frame(dsn = dsn, driver = "", layer = "", geom_type = kind,
                                             feature_count = NA, n_fields = NA, crs = "", extent = "", error = err)

peek_vector <- function(dsn) {
  j <- run_json("ogrinfo", c("-json", "-so", "-ro", "-nomd", shQuote(dsn)))
  if (is.null(j) || !length(j$layers)) return(blank(dsn, "", "ogrinfo failed or no layers"))
  do.call(rbind, lapply(j$layers, function(L) {
    gf <- if (length(L$geometryFields)) L$geometryFields[[1]] else NULL
    cs <- gf$coordinateSystem
    crs <- if (!is.null(cs$projjson$id)) paste0(cs$projjson$id$authority, ":", cs$projjson$id$code)
           else if (!is.null(cs$projjson$name)) cs$projjson$name
           else if (!is.null(cs$wkt)) sub('^[A-Z]+\\["([^"]+)".*$', "\\1", cs$wkt) else ""
    data.frame(dsn = dsn, driver = j$driverShortName, layer = L$name,
               geom_type = gf$type %||% "None", feature_count = L$featureCount %||% NA,
               n_fields = length(L$fields), crs = crs,
               extent = if (length(gf$extent)) paste(unlist(gf$extent), collapse = " ") else "",
               error = "", stringsAsFactors = FALSE)
  }))
}

peek_raster <- function(dsn, subdatasets = TRUE) {
  j <- run_json("gdalinfo", c("-json", "-nomd", "-mdd", "SUBDATASETS", shQuote(dsn)))
  if (is.null(j)) return(blank(dsn, "raster", "gdalinfo failed"))
  ## a container (raster FileGDB with several rasters) reports SUBDATASETS and no bands
  sds <- j$metadata$SUBDATASETS
  if (subdatasets && length(sds) && !length(j$bands)) {
    names_ <- unlist(sds[grepl("_NAME$", names(sds))])
    return(do.call(rbind, lapply(names_, function(s) peek_raster(s, subdatasets = FALSE))))
  }
  if (!length(j$bands)) return(blank(dsn, "raster", "gdalinfo: no bands"))
  crs <- if (!is.null(j$stac$`proj:epsg`)) paste0("EPSG:", j$stac$`proj:epsg`) else ""
  data.frame(dsn = dsn, driver = j$driverShortName,
             layer = paste0(paste(unlist(j$size), collapse = "x"), " ", length(j$bands), "band ", j$bands[[1]]$type),
             geom_type = "raster", feature_count = NA, n_fields = length(j$bands), crs = crs,
             extent = paste(c(unlist(j$cornerCoordinates$lowerLeft), unlist(j$cornerCoordinates$upperRight)), collapse = " "),
             error = "", stringsAsFactors = FALSE)
}

peek_zip <- function(url) {
  p <- plan_zip(url)
  if (is.null(p)) return(NULL)
  do.call(rbind, lapply(seq_len(nrow(p)), function(i) {
    dsn <- if (p$member[i] == "") vsi(url) else file.path(vsi(url), p$member[i])
    r <- switch(p$kind[i],
                vector = {
                  v <- peek_vector(dsn)
                  ## a .gdb with no vector layers is usually a raster FileGDB (GDAL >= 3.7 reads them)
                  if (all(v$error != "") && grepl("\\.gdb$", dsn, ignore.case = TRUE)) peek_raster(dsn) else v
                },
                raster = peek_raster(dsn),
                "gdb-empty" = blank(dsn, "", "empty gdb: system tables only, no feature classes"),
                "raster-skip" = blank(dsn, "raster", "skipped: raster in zip larger than RASTER_MAX_ZIP"))
    cbind(url = url, member = p$member[i], formats = p$formats[i], r, row.names = NULL)
  }))
}

layers_file <- "manifest/layers.csv"
## a zip is done if it has any row that is not a hard failure ("skipped" rows are deliberate)
done <- character()
if (file.exists(layers_file)) {
  prev <- read.csv(layers_file, stringsAsFactors = FALSE)
  hard <- grepl("failed|no layers|no bands", prev$error)
  redo <- setdiff(unique(prev$url[hard]), unique(prev$url[!hard]))
  ## zips peeked before gdb directories were recognised: contents show a .gdb but
  ## layers.csv has no gdb row for them
  has_gdb <- unique(contents$url[grepl("\\.gdb/?$", contents$member, ignore.case = TRUE)])
  redo <- union(redo, setdiff(has_gdb, unique(prev$url[prev$format == "gdb"])))
  ## rows written before the dsn column existed (raster FileGDB subdatasets need it)
  if (!"dsn" %in% names(prev)) { prev$dsn <- NA_character_
    redo <- union(redo, unique(prev$url[prev$geom_type == "raster" & prev$format == "gdb"])) }
  prev <- prev[!prev$url %in% redo, ]
  write.csv(prev, layers_file, row.names = FALSE, na = "")
  done <- unique(prev$url)
  if (length(redo)) message("retrying ", length(redo), " zips that previously failed")
}
todo <- setdiff(unique(contents$url[contents$member != ""]), done)
message("opening ", length(todo), " zips (", length(done), " already in layers.csv), ", CORES, " workers")

chunks <- split(todo, ceiling(seq_along(todo) / (CORES * 4)))
for (k in seq_along(chunks)) {
  res <- do.call(rbind, mclapply(chunks[[k]], function(u) {
    message("open ", basename(u)); peek_zip(u)
  }, mc.cores = CORES))
  if (is.null(res)) next
  res <- merge(files[, c("url", "name", "product", "region", "region_type")], res, by = "url")
  res$format <- ifelse(grepl("\\.gdb$", res$member, TRUE), "gdb",
                       ifelse(res$member == "" | !grepl("\\.", basename(res$member)), "shp",
                              tolower(sub("^.*\\.", "", res$member))))
  res <- res[, c("product", "region", "region_type", "name", "member", "format", "formats", "driver",
                 "layer", "geom_type", "feature_count", "n_fields", "crs", "extent", "error", "dsn", "url")]
  write.table(res, layers_file, sep = ",", row.names = FALSE, na = "",
              col.names = !file.exists(layers_file), append = file.exists(layers_file))
  message(sprintf("chunk %d/%d: %d layers written", k, length(chunks), nrow(res)))
}

layers <- read.csv(layers_file, stringsAsFactors = FALSE)
## formats carried by each zip, from contents (no network), so it is never stale
fmt_of <- function(u) {
  mm <- sub("/+$", "", contents$member[contents$url == u])
  e <- tolower(sub("^.*\\.", "", basename(mm))); e[!grepl("\\.", basename(mm))] <- ""
  paste(sort(unique(c(e[e %in% c(VEC_EXT, RAS_EXT)],
                      if (any(grepl("\\.gdb$", mm, ignore.case = TRUE))) "gdb",
                      if (any(e %in% c("xls", "xlsx", "csv"))) "tables"))), collapse = ";")
}
fm <- vapply(unique(layers$url), fmt_of, character(1))
layers$formats <- fm[layers$url]
layers <- layers[order(layers$product, layers$region, layers$format, layers$layer), ]
write.csv(layers, layers_file, row.names = FALSE, na = "")
message("layers.csv: ", nrow(layers), " rows from ", length(unique(layers$url)), " zips; ",
        sum(layers$error != ""), " with errors")
message("format combinations carried by zips:")
print(sort(table(unique(layers[, c("url", "formats")])$formats), decreasing = TRUE))

## Derived web layer for LIST_TRANSPORT_SEGMENTS (hypertidy/thelist-opendata#2)
##
## Reads the mirror's per-LGA segment GeoParquet (not the source zips) and
## writes one statewide layer for browser use to a *separate* product, since
## the mirror itself materialises nothing derivable:
##
##   <WEB_OUT>/<snapshot>/list_transport_segments.parquet  EPSG:4326, Hilbert-sorted, bbox covering
##   <WEB_OUT>/<snapshot>/list_transport_segments.pmtiles  for drawing the whole network
##   <WEB_OUT>/<snapshot>/snapshot.json                    source url / etag / mtime per LGA
##   <WEB_OUT>/latest.json                                 points at the newest snapshot
##
## Columns: TRANSEG_ID, PRI_NAME, SEC_NAME, COMP_LEN, TRANS_TYPE, TRAN_CLASS,
## lga, node0, node1, snapshot. One row per TRANSEG_ID: a segment crossing an
## LGA boundary ships *clipped* in each LGA file, so the pieces are rejoined
## (lga then lists every source LGA, ";"-separated).
##
## node0/node1: integer endpoint ids. Segments carry no node reference (the
## LIST_TRANSPORT_NODES layer has TRANODE_ID but no link to segments), so
## they're computed by exact coordinate identity in the native GDA94 / MGA55
## coordinates (wkpool::merge_coincident, tolerance 0) *before* reprojecting.
## node0 = start of first part, node1 = end of last part. Ids are stable only
## within a snapshot.
##
## snapshot: date of the newest source zip mtime (the LIST release the layer
## reflects), so a stored TRANSEG_ID can be tied to the snapshot it came from.
## Dated snapshot folders are never overwritten; only latest.json moves.
##
## No sf: gdalraster reads WKB, geos rejoins and measures, PROJ + wk transform.
##
##   Rscript R/10_transport_web.R            # build into WEB_OUT (default out_web)
## then sync WEB_OUT to the derived product (see README).

suppressPackageStartupMessages({ library(gdalraster); library(wk); library(PROJ); library(wkpool); library(jsonlite) })

PUBLIC  <- Sys.getenv("PUBLIC", "https://data.source.coop/mdsumner/thelist-opendata")
WEB_OUT <- Sys.getenv("WEB_OUT", "out_web")
keep    <- c("TRANSEG_ID", "PRI_NAME", "SEC_NAME", "COMP_LEN", "TRANS_TYPE", "TRAN_CLASS")

## sources: the conversion log says which mirror file came from which zip + etag
logf <- "manifest/converted.csv"
if (!file.exists(logf)) download.file(paste0(PUBLIC, "/", logf), logf, quiet = TRUE)
log  <- read.csv(logf, colClasses = "character")
src  <- log[grepl("^out/geoparquet/list_transport_segments/[^/]+/[^/]+\\.parquet$", log$output) &
            startsWith(log$status, "ok"), ]
src  <- src[!duplicated(src$output, fromLast = TRUE), ]
src$lga <- basename(dirname(src$output))
files <- read.csv("manifest/files.csv", colClasses = "character")
src$mtime <- files$mtime[match(src$url, files$url)]
stopifnot(nrow(src) > 0, !anyNA(src$mtime))
snapshot <- format(max(as.POSIXct(src$mtime, "UTC", format = "%Y-%m-%dT%H:%M:%SZ")), "%Y-%m-%d")
message(nrow(src), " LGA files, snapshot ", snapshot)

## read attributes + WKB geometry
read_lga <- function(i) {
  v <- new(GDALVector, paste0("/vsicurl/", PUBLIC, "/", sub("^out/", "", src$output[i])))
  on.exit(v$close())
  v$returnGeomAs <- "WKB"
  stopifnot(srs_is_same(v$getSpatialRef(), "EPSG:28355"))
  d <- v$fetch(-1)
  data.frame(d[keep], lga = src$lga[i], geom = I(as.list(d$geometry)))
}
segs <- do.call(rbind, lapply(seq_len(nrow(src)), read_lga))
g    <- geos::as_geos_geometry(wk::wkb(unclass(segs$geom), crs = NULL))
ok   <- !geos::geos_is_empty(g)
segs <- segs[ok, ]; g <- g[ok]

## a segment crossing an LGA boundary is *clipped* into each LGA file: rejoin
## the pieces per TRANSEG_ID with a directed line merge (joins pieces at their
## exactly shared cut vertex, no overlay, no vertex moves, no reversal)
as_multi <- function(x) {                     # every row a MULTILINESTRING
  u <- geos::geos_unnest(x, keep_multi = FALSE, keep_empty = FALSE)
  geos::geos_make_collection(u, "multilinestring", feature_id = attr(u, "lengths") |> (\(n) rep(seq_along(n), n))())
}
dup <- segs$TRANSEG_ID %in% segs$TRANSEG_ID[duplicated(segs$TRANSEG_ID)]
if (any(dup)) {
  o   <- which(dup)[order(segs$TRANSEG_ID[dup])]  # make_collection groups consecutive ids
  pcs <- segs[o, ]; gp <- as_multi(g[o])
  id  <- factor(pcs$TRANSEG_ID)
  u   <- geos::geos_unnest(gp, keep_multi = FALSE)
  uid <- rep(as.integer(id), attr(u, "lengths"))
  gm  <- geos::geos_line_merge_directed(geos::geos_make_collection(u, "multilinestring", feature_id = uid))
  one <- pcs[match(levels(id), pcs$TRANSEG_ID), ]
  one$lga <- vapply(split(pcs$lga, id), function(x) paste(sort(unique(x)), collapse = ";"), "")
  gm  <- as_multi(gm)
  r   <- geos::geos_length(gm) / one$COMP_LEN
  message(nlevels(id), " TRANSEG_ID clipped across LGAs, rejoined from ", nrow(pcs), " pieces; ",
          sum(geos::geos_num_geometries(gm) > 1), " still multi-part; length/COMP_LEN outside 0.99-1.01: ",
          sum(r < 0.99 | r > 1.01))
  segs <- rbind(segs[!dup, ], one); g <- c(as_multi(g[!dup]), gm)
} else g <- as_multi(g)
segs$geom <- NULL
r <- geos::geos_length(g) / segs$COMP_LEN
message("all rows: length/COMP_LEN outside 0.99-1.01: ", sum(r < 0.99 | r > 1.01, na.rm = TRUE), " of ", nrow(segs))

## endpoint nodes by exact coincidence in native coordinates
wkb0 <- wk::as_wkb(g)
pool <- merge_coincident(establish_topology(wkb0))
f    <- vctrs::field(pool, ".feature")
stopifnot(length(unique(f)) == nrow(segs))
segs$node0 <- vctrs::field(pool, ".vx0")[match(seq_len(nrow(segs)), f)]
segs$node1 <- vctrs::field(pool, ".vx1")[length(pool) + 1L - match(seq_len(nrow(segs)), rev(f))]
nparts <- geos::geos_num_geometries(g)
message(sum(nparts > 1), " multi-part segments (node0/node1 = first start / last end)")
deg <- tabulate(c(segs$node0, segs$node1))
message(sum(deg > 0), " endpoint nodes; ", sum(deg == 1), " dangling, ", sum(deg >= 3), " junctions")
segs$snapshot <- snapshot

## GDA94 / MGA55 -> lon/lat with PROJ directly: inverse projection to GDA94
## geographic, no datum step, labelled EPSG:4326 (= the EPSG:1150 null shift,
## ~1 m). Through sf/GDAL some rows (King Island sits west of zone 55's 144 E
## area of use, and others) were silently passed through untransformed.
web <- wk_transform(wkb0, proj_trans_create("EPSG:28355", "EPSG:4283"))
xy  <- wk_coords(web)
stopifnot(all(is.finite(xy$x)), all(xy$x > 143 & xy$x < 160), all(xy$y > -56 & xy$y < -39))
message("lon ", paste(round(range(xy$x), 3), collapse = " "), "; lat ", paste(round(range(xy$y), 3), collapse = " "))

## write: temp GPKG via gdalraster, then Hilbert sort to GeoParquet, PMTiles
dir <- file.path(WEB_OUT, snapshot); dir.create(dir, recursive = TRUE, showWarnings = FALSE)
tmp <- tempfile(fileext = ".gpkg"); lyr <- "list_transport_segments"
types <- c(TRANSEG_ID = "OFTInteger", PRI_NAME = "OFTString", SEC_NAME = "OFTString", COMP_LEN = "OFTReal",
           TRANS_TYPE = "OFTString", TRAN_CLASS = "OFTString", lga = "OFTString",
           node0 = "OFTInteger", node1 = "OFTInteger", snapshot = "OFTString")
defn <- ogr_def_layer("MULTILINESTRING", "geometry", srs_to_wkt("EPSG:4326"))
for (n in names(types)) defn[[n]] <- ogr_def_field(types[[n]])
ogr_ds_create("GPKG", tmp, lyr, layer_defn = defn, overwrite = TRUE)
out <- new(GDALVector, tmp, lyr, read_only = FALSE)
df  <- segs[names(types)]; df$geometry <- I(unclass(wk::as_wkb(web)))
invisible(out$startTransaction()); invisible(out$batchCreateFeature(df)); stopifnot(out$commitTransaction()); out$close()

pq  <- file.path(dir, "list_transport_segments.parquet")
run <- function(...) { a <- c(...); message("gdal ", paste(a, collapse = " ")); stopifnot(system2("gdal", a) == 0) }
run("vector", "sort", "--method", "hilbert", "--overwrite", "-f", "Parquet",
    "--lco", "COMPRESSION=ZSTD", "--lco", "ROW_GROUP_SIZE=65536", "--lco", "GEOMETRY_ENCODING=WKB",
    "--lco", "WRITE_COVERING_BBOX=YES", "--lco", "GEOMETRY_NAME=geometry", tmp, pq)
run("vector", "convert", "--overwrite", "-f", "PMTiles", "--co", "MINZOOM=6", "--co", "MAXZOOM=15",
    pq, file.path(dir, "list_transport_segments.pmtiles"))
unlink(tmp)

meta <- list(snapshot = snapshot, built = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
             crs = "EPSG:4326", source_crs = "EPSG:28355",
             transform = "inverse MGA55 to GDA94 geographic, null shift to WGS 84 (EPSG:1150)",
             rows = nrow(segs), nodes = sum(deg > 0), mirror = PUBLIC,
             sources = src[, c("lga", "url", "etag", "mtime", "output")])
meta$sources$etag <- gsub('"', "", meta$sources$etag)
write_json(meta, file.path(dir, "snapshot.json"), auto_unbox = TRUE, pretty = TRUE, dataframe = "rows")
write_json(list(snapshot = snapshot, path = paste0(snapshot, "/")),
           file.path(WEB_OUT, "latest.json"), auto_unbox = TRUE, pretty = TRUE)
message("wrote ", dir)

#!/usr/bin/env Rscript
## 24_pmtiles.R
## PMTiles map derivatives for the big vector layers, so the Portolan Browser
## (and any MapLibre client) can draw them. The browser draws a GeoParquet
## directly up to 10,000 features and 50 MB (reprojecting from its CRS); above
## that a collection needs PMTiles. Small layers stay GeoParquet-only.
##
##   <DEST>/pmtiles/<product>/statewide/<product>_statewide.pmtiles
##   stac-styles/<product>.json        MapLibre GL style (v8), source = the store URL
##   manifest/pmtiles.json             per product: layer, zooms, fields, size,
##                                     sha256, and the sha256 of the GeoParquet
##                                     it was built from (rebuilt only on change)
##
## Built with GDAL's PMTiles (MVT) writer straight from the store's GeoParquet:
## only the fields the style and popups need, Web Mercator, simplified at low
## zooms. 22_stac.R links a tileset into its collection (rel pmtiles, a visual
## asset, the style) once the file is live in the store.
##
##   Rscript R/24_pmtiles.R             # PRODUCT=regex to restrict; then upload <DEST>/pmtiles/

suppressPackageStartupMessages({ library(jsonlite); library(duckdb); library(parallel) })

PUBLIC <- Sys.getenv("PUBLIC", "https://data.source.coop/mdsumner/thelist-opendata")
DEST   <- Sys.getenv("DEST", "out")
CORES  <- as.integer(Sys.getenv("CORES", "4"))
MANF   <- "manifest/pmtiles.json"
STYLES <- "stac-styles"

## which layers get tiles, and how they are drawn. type: fill | line
TILESETS <- list(
  list_parcels = list(fields = c("PID", "CID", "TENURE_TY", "CAD_TYPE1"), type = "fill", by = "TENURE_TY", minzoom = 10, maxzoom = 15,
                      outline = TRUE, opacity = 0.35),
  list_tasveg_40 = list(fields = c("VEG_GROUP", "VEGCODE", "VEGCODE_D"), type = "fill", by = "VEG_GROUP", minzoom = 7, maxzoom = 13, opacity = 0.75),
  list_transport_segments = list(fields = c("TRANSEG_ID", "TRAN_CLASS", "TRANS_TYPE", "PRI_NAME"), type = "line", by = "TRAN_CLASS", minzoom = 7, maxzoom = 14),
  list_landslide_planning_map_hazard_bands = list(fields = c("HAZARD_BAND_1", "COMPONENT"), type = "fill", by = "HAZARD_BAND_1", minzoom = 8, maxzoom = 13,
                                                  opacity = 0.7, order = c("Low", "Medium", "Medium - Active", "High"),
                                                  colours = c("#f2e394", "#f2b134", "#e4572e", "#a4161a")))

cat_json <- fromJSON("site/catalog.json", simplifyVector = FALSE)
sums <- read.csv("manifest/checksums.csv", colClasses = "character"); sha <- setNames(sums$sha256, sums$path)
man <- if (file.exists(MANF)) fromJSON(MANF, simplifyVector = FALSE) else list()
todo <- names(TILESETS)
if (nzchar(Sys.getenv("PRODUCT"))) todo <- todo[grepl(Sys.getenv("PRODUCT"), todo, ignore.case = TRUE)]

src_of <- function(prod) Filter(function(it) it$kind == "vector" && strsplit(it$path, "/")[[1]][2] == prod, cat_json$items)[[1]]
sha_file <- function(f) sub(" .*", "", system(sprintf("sha256sum %s", shQuote(f)), intern = TRUE))

## categorical colours: a fixed qualitative palette, most common category first
PALETTE <- c("#1b9e77", "#d95f02", "#7570b3", "#e7298a", "#66a61e", "#e6ab02", "#a6761d", "#1f78b4", "#b2df8a", "#fb9a99", "#cab2d6", "#ffff99")
categories <- function(url, col, order = NULL) {
  con <- dbConnect(duckdb(shared_home = FALSE)); on.exit(dbDisconnect(con, shutdown = TRUE))
  invisible(dbExecute(con, "INSTALL httpfs; LOAD httpfs;"))
  d <- dbGetQuery(con, sprintf('SELECT "%s" AS v, count(*) AS n FROM read_parquet(\'%s\') WHERE "%s" IS NOT NULL GROUP BY 1 ORDER BY n DESC', col, url, col))
  if (!is.null(order)) d <- d[order(match(d$v, order)), ]
  d
}

style_for <- function(prod, cfg, it, cats, url) {
  layer <- prod
  vals <- cats$v
  cols <- if (!is.null(cfg$colours)) cfg$colours[match(vals, cfg$order)] else PALETTE[(seq_along(vals) - 1) %% length(PALETTE) + 1]
  cols[is.na(cols)] <- "#999999"
  if (length(vals) > length(PALETTE) && is.null(cfg$colours)) cols[(length(PALETTE) + 1):length(vals)] <- "#9a9a9a"   # the long tail in grey
  match_expr <- c(list("match", list("get", cfg$by)), as.list(c(rbind(vals, cols))), list("#9a9a9a"))
  layers <- if (cfg$type == "fill") {
    l <- list(list(id = paste0(layer, "-fill"), type = "fill", source = "data", `source-layer` = layer,
                   paint = list(`fill-color` = match_expr, `fill-opacity` = cfg$opacity %||% 0.6)))
    if (isTRUE(cfg$outline)) l <- c(l, list(list(id = paste0(layer, "-line"), type = "line", source = "data", `source-layer` = layer,
                                                 paint = list(`line-color` = "#1f4e45", `line-width` = list("interpolate", list("linear"), list("zoom"), 10, 0.2, 16, 1.2)))))
    l
  } else {
    major <- c("National/State Highway", "Arterial Road", "Sub Arterial Road", "Collector Road")
    list(list(id = paste0(layer, "-line"), type = "line", source = "data", `source-layer` = layer,
              paint = list(`line-color` = match_expr,
                           `line-width` = list("interpolate", list("linear"), list("zoom"), 7,
                                               list("case", list("in", list("get", cfg$by), list("literal", major)), 1.4, 0.3), 14,
                                               list("case", list("in", list("get", cfg$by), list("literal", major)), 4, 1.2)))))
  }
  list(version = 8, name = paste(it$title, "by", tolower(gsub("_", " ", cfg$by))),
       metadata = list(legend = lapply(seq_along(vals), function(i) list(label = vals[i], color = cols[i])), attribution = "theLIST (c) State of Tasmania, CC BY 3.0 AU"),
       sources = list(data = list(type = "vector", url = paste0("pmtiles://", url), attribution = "theLIST (c) State of Tasmania, CC BY 3.0 AU")),
       layers = layers)
}

build <- function(prod) {
  cfg <- TILESETS[[prod]]; it <- src_of(prod)
  src_sha <- sha[[it$path]]
  rel <- sprintf("pmtiles/%s/statewide/%s_statewide.pmtiles", prod, prod)
  out <- file.path(DEST, rel); dir.create(dirname(out), recursive = TRUE, showWarnings = FALSE)
  prev <- man[[prod]]
  if (!is.null(prev) && identical(prev$source_sha256, src_sha) && file.exists(out)) return(prev)
  url <- paste0(PUBLIC, "/", it$path)
  args <- c("vector", "pipeline", paste(
    "read", shQuote(paste0("/vsicurl/", url)),
    "! select", paste("--field", cfg$fields, collapse = " "), "--geometry-field geometry",   # keep the geometry (a bare field list drops it)
    "! write --of PMTiles --overwrite",
    sprintf("--co MINZOOM=%d --co MAXZOOM=%d", cfg$minzoom, cfg$maxzoom),
    "--co SIMPLIFICATION=2 --co SIMPLIFICATION_MAX_ZOOM=1",
    "--co MAX_SIZE=2000000 --co MAX_FEATURES=400000",
    sprintf("--co NAME=%s", shQuote(it$title)),
    sprintf("--co DESCRIPTION=%s", shQuote(paste0("theLIST (c) State of Tasmania, CC BY 3.0 AU. From ", it$path))),
    "--output-layer", prod, shQuote(out)))
  t0 <- Sys.time(); message(prod, ": tiling z", cfg$minzoom, "-", cfg$maxzoom)
  rc <- system2("gdal", args, stdout = FALSE, stderr = file.path(tempdir(), paste0(prod, ".log")))
  if (rc != 0L) stop(prod, ": gdal failed, see ", file.path(tempdir(), paste0(prod, ".log")))
  cats <- categories(url, cfg$by, cfg$order)
  store_url <- paste0(PUBLIC, "/", rel)
  dir.create(STYLES, showWarnings = FALSE)
  writeLines(toJSON(style_for(prod, cfg, it, cats, store_url), auto_unbox = TRUE, pretty = TRUE), file.path(STYLES, paste0(prod, ".json")))
  message(prod, ": ", round(file.size(out) / 1e6, 1), " MB in ", round(as.numeric(difftime(Sys.time(), t0, units = "mins")), 1), " min")
  list(path = rel, layer = prod, minzoom = cfg$minzoom, maxzoom = cfg$maxzoom, fields = cfg$fields, color_by = cfg$by,
       geometry = it$geometry, bytes = file.size(out), sha256 = sha_file(out), source = it$path, source_sha256 = src_sha,
       center = NULL, built = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"))
}

res <- mclapply(todo, function(p) tryCatch(build(p), error = function(e) { message(conditionMessage(e)); NULL }), mc.cores = CORES, mc.preschedule = FALSE)
names(res) <- todo
for (p in todo) if (!is.null(res[[p]])) man[[p]] <- res[[p]]
writeLines(toJSON(man, auto_unbox = TRUE, pretty = TRUE, null = "null"), MANF)
message("tilesets in ", MANF, ": ", paste(names(man), collapse = ", "))

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

## TASVEG vegetation groups share one palette across versions, keyed on the group
## name with punctuation and 'and' dropped (4.0 and 5.0 spell them a little differently)
norm_group <- function(x) gsub("[^a-z]", "", gsub("\\band\\b", "", tolower(x)))
TASVEG_COLOURS <- setNames(
  c("#e8d9a8", "#1b7837", "#a6cf6b", "#c2a35b", "#00441b", "#5aae61", "#bdbdbd", "#c994c7", "#8c6bb1", "#4eb3d3", "#fdd49e"),
  norm_group(c("Modified land", "Wet eucalypt forest and woodland", "Dry eucalypt forest and woodland", "Scrub, heathland and coastal complexes",
               "Rainforest and related scrub", "Non eucalypt forest and woodland", "Other natural environments", "Moorland, sedgeland and rushland",
               "Highland and treeless vegetation", "Saltmarsh and wetland", "Native grassland")))
TASVEG_COLOURS[norm_group("Highland treeless vegetation")] <- TASVEG_COLOURS[norm_group("Highland and treeless vegetation")]
## 3.0 and the 4.0 fire attributes use the older names of two groups
TASVEG_COLOURS[norm_group("Agricultural, urban and exotic vegetation")] <- TASVEG_COLOURS[norm_group("Modified land")]
TASVEG_COLOURS[norm_group("Moorland, sedgeland, rushland and peatland")] <- TASVEG_COLOURS[norm_group("Moorland, sedgeland and rushland")]
## TASVEG 5.0 carries only the group code; names from its fire-attributes companion (joined on VEGCODE)
TASVEG5_GROUPS <- c(`1` = "Dry eucalypt forest and woodland", `2` = "Wet eucalypt forest and woodland", `3` = "Rainforest and related scrub",
                    `4` = "Non eucalypt forest and woodland", `5` = "Saltmarsh and wetland", `6` = "Scrub heathland and coastal complexes",
                    `7` = "Highland treeless vegetation", `8` = "Moorland sedgeland and rushland", `9` = "Native grassland",
                    `10` = "Modified land", `11` = "Other natural environments")

## which layers get tiles, and how they are drawn. type: fill | line
TILESETS <- list(
  list_parcels = list(fields = c("PID", "CID", "TENURE_TY", "CAD_TYPE1"), type = "fill", by = "TENURE_TY", minzoom = 10, maxzoom = 15,
                      outline = TRUE, opacity = 0.35),
  list_tasveg_40 = list(fields = c("VEG_GROUP", "VEGCODE", "VEGCODE_D"), type = "fill", by = "VEG_GROUP", minzoom = 7, maxzoom = 13, opacity = 0.75,
                        palette = "tasveg"),
  ## 5.0 carries only the code: a VEG_GROUP name column is derived in the tiles, so the map legend
  ## (read from the style's match values) and feature popups show names
  list_tasveg_50 = list(fields = c("VEG_GRP_CODE", "VEGCODE"), type = "fill", by = "VEG_GROUP", minzoom = 7, maxzoom = 13, opacity = 0.75,
                        palette = "tasveg", derive = list(name = "VEG_GROUP", from = "VEG_GRP_CODE", map = TASVEG5_GROUPS)),
  list_transport_segments = list(fields = c("TRANSEG_ID", "TRAN_CLASS", "TRANS_TYPE", "PRI_NAME"), type = "line", by = "TRAN_CLASS", minzoom = 7, maxzoom = 14),
  list_landslide_planning_map_hazard_bands = list(fields = c("HAZARD_BAND_1", "COMPONENT"), type = "fill", by = "HAZARD_BAND_1", minzoom = 8, maxzoom = 13,
                                                  opacity = 0.7, order = c("Low", "Medium", "Medium - Active", "High"),
                                                  colours = c("#f2e394", "#f2b134", "#e4572e", "#a4161a")))

cat_json <- fromJSON("site/catalog.json", simplifyVector = FALSE)
sums <- read.csv("manifest/checksums.csv", colClasses = "character"); sha <- setNames(sums$sha256, sums$path)
man <- if (file.exists(MANF)) fromJSON(MANF, simplifyVector = FALSE) else list()
vec_items <- function(prod) Filter(function(it) it$kind == "vector" && strsplit(it$path, "/")[[1]][2] == prod, cat_json$items)
src_of <- function(prod) vec_items(prod)[[1]]
md5_str <- function(x) { f <- tempfile(); writeLines(x, f); h <- unname(tools::md5sum(f)); unlink(f); h }

## SES historic flood events: a file per event. One tileset stacks them all into one layer (stack: the field
## naming each feature's file), since the browser draws a collection from its tiles instead of its files:
## tiling only June 2016, the one file over its limit, would hide the other events. Coloured by date.
flood_files <- sort(sub("\\.parquet$", "", basename(vapply(vec_items("ses_historic_flood_event_extent"), `[[`, "", "path"))))
if (length(flood_files)) {
  lab <- gsub("_", " ", sub("^flood_extent_", "", flood_files))                         # flood_extent_june_2016 -> June 2016
  lab <- paste0(toupper(substr(lab, 1, 1)), substring(lab, 2))                          # (toTitleCase keeps 'may' lower case)
  when <- as.numeric(sub(".* ", "", lab)) * 12 + match(tolower(sub(" .*", "", lab)), tolower(month.name))
  TILESETS$ses_historic_flood_event_extent <- list(stack = "SOURCE", fields = character(), type = "fill", by = "EVENT",
    minzoom = 6, maxzoom = 14, opacity = 0.55, outline = TRUE, order = lab[order(when)],
    colours = hcl.colors(length(lab) + 3, "YlGnBu", rev = TRUE)[-(1:3)],                 # oldest lightest; the palest dropped
    derive = list(name = "EVENT", from = "SOURCE", map = setNames(lab, flood_files)))
}

## Any other layer over the browser's direct-draw limit can be tiled with a default config:
## AUTO_MAX_ROWS=50000 tiles every unconfigured over-limit layer up to that many features.
## Up to 8 descriptive fields, one colour by geometry type, minimum zoom from feature count.
OVER_ROWS <- 10000; OVER_BYTES <- 52428800                     # the Portolan Browser's GeoParquet limits
SYSTEM_FIELDS <- c("SHAPE_Length", "SHAPE_Area", "SHAPE_LENG", "OBJECTID", "FID", "UFI", "LIST_GUID", "CREATED_ON", "COMP_AREA",
                   "COMP_LEN", "MEAS_AREA", "FMP", "NOM_REG_NO", "CRC_ID", "lga", "SHAPE", "geometry", "geometry_bbox", "SHAPE_bbox")
ASSIGN_CRS <- c(list_tasveg_20 = "EPSG:28355")                  # no CRS in its GeoParquet (would read as lon/lat); MGA55 metres
## overrides for automatic layers: style settings only restyle; tile settings (fields, zooms) rebuild the tiles
TASVEG_LIKE <- list(by = "VEG_GROUP", palette = "tasveg", opacity = 0.75, outline = FALSE, minzoom = 7)   # drawn like TASVEG 4.0 and 5.0
AUTO_OVERRIDES <- list(list_tasveg_30 = TASVEG_LIKE, list_tasveg_30_groups = TASVEG_LIKE,
                       list_tasveg_40_fire_attributes = TASVEG_LIKE, list_tasveg_50_fire_attributes = TASVEG_LIKE)
auto_cfg <- function(it) {
  cols <- setdiff(vapply(it$columns, function(c) c[[1]], ""), SYSTEM_FIELDS)
  pri <- grepl("NAME|TYPE|_TY$|CLASS|CATEG|DESC|CODE|ZONE|STATUS|GROUP|BAND|PURPOSE", cols, ignore.case = TRUE)
  cols <- c(cols[pri], cols[!pri]); cols <- cols[seq_len(min(8, length(cols)))]
  geom <- it$geometry %||% ""
  type <- if (grepl("Polygon", geom)) "fill" else if (grepl("Line", geom)) "line" else "circle"
  n <- it$rows %||% 0
  list(fields = cols, type = type, minzoom = if (n <= 50000) 6 else if (n <= 150000) 8 else if (n <= 500000) 9 else 10,
       maxzoom = 14, opacity = 0.45, outline = type == "fill", auto = TRUE)
}
AUTO_MAX <- as.numeric(Sys.getenv("AUTO_MAX_ROWS", "0"))
if (AUTO_MAX > 0) {
  for (it in cat_json$items) {
    prod <- strsplit(it$path, "/")[[1]][2]
    over <- (it$rows %||% 0) > OVER_ROWS || it$bytes > OVER_BYTES
    if (it$kind != "vector" || !over || (it$rows %||% 0) > AUTO_MAX || prod %in% names(TILESETS) ||
        prod == "tasveg_5_release" || grepl("\\.gdb\\.parquet$", it$path)) next
    if (!identical(src_of(prod)$path, it$path)) next             # one tileset per product: its first vector file
    TILESETS[[prod]] <- auto_cfg(it)
    if (prod %in% names(ASSIGN_CRS)) TILESETS[[prod]]$crs <- ASSIGN_CRS[[prod]]
    if (prod %in% names(AUTO_OVERRIDES)) TILESETS[[prod]] <- modifyList(TILESETS[[prod]], AUTO_OVERRIDES[[prod]])
  }
}
todo <- names(TILESETS)
if (nzchar(Sys.getenv("PRODUCT"))) todo <- todo[grepl(Sys.getenv("PRODUCT"), todo, ignore.case = TRUE)]
if (Sys.getenv("DRY") == "1") {                                   # show what would be tiled, and how
  for (p in todo) { k <- TILESETS[[p]]; message(sprintf("%-55s %-6s z%d-%d %s  [%s]", p, k$type, k$minzoom, k$maxzoom,
                                                        if (isTRUE(k$auto)) "auto" else "configured", paste(k$fields, collapse = ", "))) }
  quit(save = "no")
}
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

INK <- "#1f6f5c"
style_for <- function(prod, cfg, it, cats, url) {
  layer <- prod
  vals <- if (is.null(cats)) character() else cats$v
  labs <- if (!is.null(cfg$labels)) unname(ifelse(is.na(cfg$labels[as.character(vals)]), as.character(vals), cfg$labels[as.character(vals)])) else as.character(vals)
  cols <- if (identical(cfg$palette, "tasveg")) unname(TASVEG_COLOURS[norm_group(labs)])
          else if (!is.null(cfg$colours)) cfg$colours[match(vals, cfg$order)] else PALETTE[(seq_along(vals) - 1) %% length(PALETTE) + 1]
  cols[is.na(cols)] <- "#999999"
  if (length(vals) > length(PALETTE) && is.null(cfg$colours) && is.null(cfg$palette)) cols[(length(PALETTE) + 1):length(vals)] <- "#9a9a9a"   # the long tail in grey
  ## value/colour pairs, keeping each value's type (rbind() would turn numeric codes into strings that never match)
  match_expr <- if (is.null(cfg$by)) INK else
    c(list("match", list("get", cfg$by)), unlist(Map(function(v, k) list(v, k), vals, cols), recursive = FALSE, use.names = FALSE), list("#9a9a9a"))
  layers <- if (cfg$type == "circle") {
    list(list(id = paste0(layer, "-point"), type = "circle", source = "data", `source-layer` = layer,
              paint = list(`circle-color` = match_expr, `circle-opacity` = 0.85,
                           `circle-radius` = list("interpolate", list("linear"), list("zoom"), 6, 1.2, 14, 4.5),
                           `circle-stroke-color` = "#ffffff", `circle-stroke-width` = list("interpolate", list("linear"), list("zoom"), 6, 0, 14, 0.8))))
  } else if (cfg$type == "fill") {
    l <- list(list(id = paste0(layer, "-fill"), type = "fill", source = "data", `source-layer` = layer,
                   paint = list(`fill-color` = match_expr, `fill-opacity` = cfg$opacity %||% 0.6)))
    if (isTRUE(cfg$outline)) l <- c(l, list(list(id = paste0(layer, "-line"), type = "line", source = "data", `source-layer` = layer,
                                                 paint = list(`line-color` = "#1f4e45", `line-width` = list("interpolate", list("linear"), list("zoom"), 10, 0.2, 16, 1.2)))))
    l
  } else if (!identical(cfg$by, "TRAN_CLASS")) {
    list(list(id = paste0(layer, "-line"), type = "line", source = "data", `source-layer` = layer,
              paint = list(`line-color` = match_expr, `line-width` = list("interpolate", list("linear"), list("zoom"), 6, 0.4, 14, 2))))
  } else {
    major <- c("National/State Highway", "Arterial Road", "Sub Arterial Road", "Collector Road")
    list(list(id = paste0(layer, "-line"), type = "line", source = "data", `source-layer` = layer,
              paint = list(`line-color` = match_expr,
                           `line-width` = list("interpolate", list("linear"), list("zoom"), 7,
                                               list("case", list("in", list("get", cfg$by), list("literal", major)), 1.4, 0.3), 14,
                                               list("case", list("in", list("get", cfg$by), list("literal", major)), 4, 1.2)))))
  }
  list(version = 8, name = if (is.null(cfg$by)) it$title else paste(it$title, "by", if (identical(cfg$palette, "tasveg")) "vegetation group" else tolower(gsub("_", " ", cfg$by))),
       metadata = list(legend = lapply(seq_along(vals), function(i) list(label = labs[i], value = vals[i], color = cols[i])), attribution = "theLIST (c) State of Tasmania, CC BY 3.0 AU"),
       sources = list(data = list(type = "vector", url = paste0("pmtiles://", url), attribution = "theLIST (c) State of Tasmania, CC BY 3.0 AU")),
       layers = layers)
}

remote_size <- function(url) {                                   # Content-Length from a HEAD request; NA if unreachable
  h <- tryCatch(curlGetHeaders(url), error = function(e) character())
  cl <- grep("^content-length:", h, ignore.case = TRUE, value = TRUE)
  if (length(cl)) as.numeric(trimws(sub("^[^:]*:", "", cl[length(cl)]))) else NA_real_
}

build <- function(prod) {
  cfg <- TILESETS[[prod]]; it <- src_of(prod)
  paths <- if (is.null(cfg$stack)) it$path else vapply(vec_items(prod), `[[`, "", "path")   # stacked: every vector file
  src_sha <- if (length(paths) == 1) sha[[it$path]] else md5_str(paste(paths, sha[paths]))
  rel <- sprintf("pmtiles/%s/statewide/%s_statewide.pmtiles", prod, prod)
  out <- file.path(DEST, rel); dir.create(dirname(out), recursive = TRUE, showWarnings = FALSE)
  prev <- man[[prod]]
  url <- paste0(PUBLIC, "/", it$path)
  store_url <- paste0(PUBLIC, "/", rel)
  write_style <- function() {                                   # styles are cheap: always rewritten
    dir.create(STYLES, showWarnings = FALSE)
    cats <- if (is.null(cfg$by)) NULL else if (!is.null(cfg$stack)) data.frame(v = cfg$order) else if (is.null(cfg$derive)) categories(url, cfg$by, cfg$order) else {
      d <- categories(url, cfg$derive$from); d$v <- unname(cfg$derive$map[as.character(d$v)]); d }
    writeLines(toJSON(style_for(prod, cfg, it, cats, store_url), auto_unbox = TRUE, pretty = TRUE),
               file.path(STYLES, paste0(prod, ".json")))
  }
  ## only what goes into the tiles decides a rebuild; style settings (by, palette, type, opacity, ...) just rewrite the style
  tile_cfg <- cfg[intersect(c("fields", "minzoom", "maxzoom", "derive", "crs", "stack"), names(cfg))]
  tiles_hash <- { f <- tempfile(); writeLines(as.character(toJSON(tile_cfg, auto_unbox = TRUE)), f); h <- unname(tools::md5sum(f)); unlink(f); h }
  same_tiles <- !is.null(prev) && (if (!is.null(prev$tiles_md5)) identical(prev$tiles_md5, tiles_hash) else   # older entries: what they record
    identical(as.character(unlist(prev$fields)), as.character(cfg$fields)) && prev$minzoom == cfg$minzoom && prev$maxzoom == cfg$maxzoom)
  ## the tiles are here, or (a fresh checkout, e.g. CI) already in the store at the recorded size
  have <- file.exists(out) || (!is.null(prev$bytes) && identical(remote_size(store_url), as.numeric(prev$bytes)))
  force <- nzchar(Sys.getenv("FORCE")) && grepl(Sys.getenv("FORCE"), prod)        # FORCE=regex rebuilds
  if (!force && same_tiles && identical(prev$source_sha256, src_sha) && have) {
    write_style(); prev$tiles_md5 <- tiles_hash; prev$config_md5 <- NULL; prev["color_by"] <- list(cfg$by); return(prev)
  }
  src_layer <- sub("\\.parquet$", "", basename(it$path))
  input <- paste0("/vsicurl/", url)
  if (!is.null(cfg$stack)) {                                     # one local GeoParquet of all the files, each feature's file in cfg$stack
    input <- file.path(tempdir(), paste0(prod, ".parquet")); src_layer <- prod
    rc <- system2("gdal", c("vector", "concat", "--mode single", "--overwrite", "--source-layer-field-name", cfg$stack,
                            "--source-layer-field-content", shQuote("{DS_BASENAME}"),
                            shQuote(paste0("/vsicurl/", PUBLIC, "/", paths)), shQuote(input)),
                  stdout = FALSE, stderr = file.path(tempdir(), paste0(prod, "-concat.log")))
    if (rc != 0L) stop(prod, ": gdal concat failed, see ", file.path(tempdir(), paste0(prod, "-concat.log")))
  }
  gcol <- if (!is.null(cfg$stack)) "geometry" else local({                                                # the primary geometry column ('SHAPE' in files from bare gdbs)
    con <- dbConnect(duckdb(shared_home = FALSE)); on.exit(dbDisconnect(con, shutdown = TRUE))
    invisible(dbExecute(con, "INSTALL httpfs; LOAD httpfs;"))
    g <- dbGetQuery(con, sprintf("SELECT decode(value) v FROM parquet_kv_metadata('%s') WHERE decode(key) = 'geo'", url))$v
    if (length(g)) fromJSON(g)$primary_column else "geometry" })
  pick <- if (is.null(cfg$derive)) paste("! select", paste("--field", cfg$fields, collapse = " "), "--geometry-field", gcol)   # name the geometry (a bare field list drops it)
          else {                                                 # add a derived name column with a CASE over the code
            dv <- cfg$derive
            key <- names(dv$map); if (!all(grepl("^-?[0-9.]+$", key))) key <- sprintf("'%s'", gsub("'", "''", key))   # quote text codes
            case <- paste0("CASE ", dv$from, " ", paste(sprintf("WHEN %s THEN '%s'", key, gsub("'", "''", dv$map)), collapse = " "), " END AS ", dv$name)
            paste("! sql --dialect SQLite", shQuote(sprintf("SELECT %s FROM \"%s\"", paste(c(cfg$fields, case, "geometry"), collapse = ", "), src_layer)))
          }
  args <- c("vector", "pipeline", paste(
    "read", shQuote(input),
    if (is.null(cfg$crs)) "" else paste("! edit --crs", cfg$crs),   # assign, not reproject
    pick,
    "! write --of PMTiles --overwrite",
    sprintf("--co MINZOOM=%d --co MAXZOOM=%d", cfg$minzoom, cfg$maxzoom),
    "--co SIMPLIFICATION=2 --co SIMPLIFICATION_MAX_ZOOM=1",
    "--co MAX_SIZE=2000000 --co MAX_FEATURES=400000",
    sprintf("--co NAME=%s", shQuote(it$title)),
    sprintf("--co DESCRIPTION=%s", shQuote(paste0("theLIST (c) State of Tasmania, CC BY 3.0 AU. From ", paste(paths, collapse = ", ")))),
    "--output-layer", prod, shQuote(out)))
  t0 <- Sys.time(); message(prod, ": tiling z", cfg$minzoom, "-", cfg$maxzoom)
  rc <- system2("gdal", args, stdout = FALSE, stderr = file.path(tempdir(), paste0(prod, ".log")))
  if (rc != 0L) stop(prod, ": gdal failed, see ", file.path(tempdir(), paste0(prod, ".log")))
  write_style()
  message(prod, ": ", round(file.size(out) / 1e6, 1), " MB in ", round(as.numeric(difftime(Sys.time(), t0, units = "mins")), 1), " min")
  list(path = rel, layer = prod, minzoom = cfg$minzoom, maxzoom = cfg$maxzoom, fields = cfg$fields, color_by = cfg$by,
       geometry = it$geometry, bytes = file.size(out), sha256 = sha_file(out), source = if (length(paths) == 1) it$path else paste0(dirname(it$path), "/"),
       sources = if (length(paths) > 1) paths, source_sha256 = src_sha, tiles_md5 = tiles_hash,
       center = NULL, built = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"))
}

res <- mclapply(todo, function(p) tryCatch(build(p), error = function(e) { message(conditionMessage(e)); NULL }), mc.cores = CORES, mc.preschedule = FALSE)
names(res) <- todo
for (p in todo) if (!is.null(res[[p]])) man[[p]] <- res[[p]]
writeLines(toJSON(man, auto_unbox = TRUE, pretty = TRUE, null = "null"), MANF)
message("tilesets in ", MANF, ": ", paste(names(man), collapse = ", "))

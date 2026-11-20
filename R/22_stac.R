#!/usr/bin/env Rscript
## 22_stac.R
## A STAC 1.1 catalogue of the statewide files, conforming to the Portolan
## profile (https://schemas.portolan-sdi.org/portolan/v0.1.0/schema.json), so it
## opens in the Portolan Browser and validates with `portolan check`.
##
##   <STAC_OUT>/catalog.json, README.md, AGENTS.md          root
##   <STAC_OUT>/<theme>[/<sub>]/catalog.json, README.md, AGENTS.md
##   .../<product>/collection.json, README.md, AGENTS.md     one per LIST product
##   .../<product>/<file>/<file>.json                        one item per COG
##
## Themes come from the product code (rules below); enterprise suitability is
## split again by crop. Vector and table files are collection assets (as in the
## Portolan NL catalogue); each COG is an item. Built from site/catalog.json
## (what is in the store; R/20_catalog.R), manifest/checksums.csv
## (R/21_checksums.R) and, when present, stac-thumbs/ (R/23_thumbnails.R).
## No data file moves: asset hrefs are absolute https URLs into the store
## (ASSET_BASE), so the tree can be served from anywhere; it is staged on GitHub
## Pages under site/stac/.
##
##   Rscript R/22_stac.R                 # STAC_OUT=site/stac
##   portolan stac-geoparquet --catalog site/stac   # items.parquet mirrors (make stac does both)
## Also writes site/stac-paths.json (product -> collection.json) for the site.

suppressPackageStartupMessages({ library(jsonlite); library(PROJ); library(wk) })

ASSET_BASE <- Sys.getenv("ASSET_BASE", "https://data.source.coop/mdsumner/thelist-opendata")
STAC_OUT   <- Sys.getenv("STAC_OUT", "site/stac")
THUMBS     <- Sys.getenv("THUMBS", "stac-thumbs")          # <product>.png, made by R/23_thumbnails.R
SITE       <- Sys.getenv("SITE", "https://hypertidy.github.io/thelist-opendata/")
STAC_VERSION <- "1.1.0"
EXT <- c(portolan = "https://schemas.portolan-sdi.org/portolan/v0.1.0/schema.json",
         file = "https://stac-extensions.github.io/file/v2.1.0/schema.json",
         proj = "https://stac-extensions.github.io/projection/v2.0.0/schema.json",
         table = "https://stac-extensions.github.io/table/v1.2.0/schema.json")
LICENSE_URL <- "https://creativecommons.org/licenses/by/3.0/au/"
PROVIDERS <- list(                                         # Portolan: the host provider comes last
  list(name = "Land Tasmania (theLIST)", roles = I(c("producer", "licensor")), url = "https://www.thelist.tas.gov.au/",
       description = "Publishes the LIST open data bulk downloads, the source of every file here."),
  list(name = "hypertidy/thelist-opendata", roles = I("processor"), url = "https://github.com/hypertidy/thelist-opendata",
       description = "Converted the LIST zips to GeoParquet and COG; built the statewide layers of LGA-split products."),
  list(name = "Source Cooperative", roles = I("host"), url = "https://source.coop/mdsumner/thelist-opendata"))
ROOT_TITLE <- "Tasmania LIST open data, cloud-ready"

## ---- themes ------------------------------------------------------------------------------
## first match wins, on the LIST product code
THEMES <- list(
  list(id = "enterprise-suitability", title = "Enterprise suitability (crops)", re = "^NCH_ES_(?!.*(HAZARD|EROSIVITY))",
       description = "Natural Capital Hub land suitability for agricultural enterprises, by crop, current and climate-change scenarios (2030, 2050; A2, B1)."),
  list(id = "soils-agriculture", title = "Soils, land use and agriculture",
       re = "SOIL|^NCH_|LAND.CAPABILITY|LAND_USE|LAND_POTENTIAL|POTENTIAL_AG|ACID_SULFATE|LANDFORM",
       description = "Soil mapping and properties, land capability, land use, agricultural potential and soil hazards."),
  list(id = "hazards-climate", title = "Natural hazards and climate", re = "COASTAL_|LANDSLIDE|^TSFM_|^SES_|FLOOD|FIRE_HISTORY|^CFT_",
       description = "Coastal erosion, inundation and sea level rise, landslide, flood mapping, fire history and climate futures."),
  list(id = "marine-fisheries", title = "Marine and fisheries",
       re = "ABALONE|LOBSTER|SCALEFISH|DANISH_SEINE|MARINE_|SHELLMAP|KELP|MACROCYSTIS|RECREATIONAL_FISHING|SEWAGE_DISCHARGE|SWIMMING_BEACHES|TERRITORIAL_SEA",
       description = "Fishing blocks and zones, marine farming, leases and reserves, kelp, shellfish and water quality."),
  list(id = "water", title = "Water and hydrography",
       re = "HYD(AREA|LINE|PNT)|CFEV|GROUNDWATER|WATER_MANAGEMENT|WATER_DISTRICTS|OFFTAKES|RAMSAR|EPA_AQUATIC|DRINKING_CATCH|IRRIGATION",
       description = "Rivers, waterbodies and catchments, conservation of freshwater ecosystem values (CFEV), groundwater, water management and irrigation."),
  list(id = "taswater", title = "TasWater water and sewer", re = "TASWATER",
       description = "TasWater's water supply and sewer networks, serviced land and operational areas."),
  list(id = "infrastructure-services", title = "Infrastructure, utilities and services",
       re = "TASWATER|TASNETWORKS|GAS|ENWAVE|BUILT_INFRASTRUCTURE|EPA_UNDERGROUND|EPA_REGULATED|COMMUNITY_FACILITIES|AMBULANCE|EMERGENCY|LIQUOR",
       description = "Water, sewer, electricity and gas networks, community facilities and services, regulated sites."),
  list(id = "topography-imagery", title = "Elevation, imagery and map indexes",
       re = "(^|_)DEM(_|$)|CONTOURS|SPOT_HEIGHTS|COASTLINE|LIDAR|TASMAP|AERIAL_PHOTO|LANDSAT",
       description = "Elevation and contours, the coastline, LiDAR coverage, aerial photography, Landsat mosaics and map sheet indexes."),
  list(id = "vegetation-biodiversity", title = "Vegetation, biodiversity and reserves",
       re = "TASVEG|VEGETATION|EAGLE|DEER|ROADKILL|FOREST|TIMBER|RESERVE|^PFT_",
       description = "TASVEG vegetation mapping, threatened communities, fauna habitat, forests and the reserve estate."),
  list(id = "planning-heritage", title = "Planning and heritage", re = "PLANNING_SCHEME|HERITAGE",
       description = "Planning scheme zones and overlays, and heritage registers."),
  list(id = "boundaries-names", title = "Boundaries and place names",
       re = "MUNICIPALITY|LOCAL_GOVT|LOCALITY|ELECTORAL|LEGISLATIVE|SCHOOL_INTAKE|FMAC|NAMED_FEATURE|NOMENCLATURE|PARISH|LAND_DISTRICTS",
       description = "Local government areas, localities and postcodes, electoral divisions, land districts and parishes, and place names."),
  list(id = "property-cadastre", title = "Cadastre, property and buildings",
       re = "PARCELS|AUTHORITY_LAND|EASEMENTS|CROWN_|LAND_TENURE|PUBLIC_LAND|ADDRESS|BUILDING|SURVEY_CONTROL|BOUNDARY_SEGS",
       description = "Cadastral parcels and boundaries, tenure, public land classification, Crown leases, easements, addresses and buildings."),
  list(id = "transport", title = "Transport", re = "TRANSPORT",
       description = "The road, rail, ferry and track network: segments and nodes."),
  list(id = "other", title = "Other", re = ".", description = "Datasets that fit no other theme here."))
CROPS <- list(c("blueberries", "^BLUEB"), c("carrot-seed", "^CARROT_SEED"), c("carrots", "^CARROTS"), c("industrial-hemp", "^INDUST"),
              c("rye-grass", "^RYE"), c("sparkling-wine-grapes", "^(S_WINE|SPARK)"), c("table-wine-grapes", "^(T_WINE|TABLE)"))
crop_of <- function(code) {
  rest <- sub("^NCH_ES_", "", code)
  for (cr in CROPS) if (grepl(cr[2], rest)) return(cr[1])
  tolower(sub("_.*", "", rest))
}
crop_title <- function(id) paste0(toupper(substr(id, 1, 1)), gsub("-", " ", substr(id, 2, nchar(id))))
## second level for the large themes (first match wins; the last rule catches the rest)
SUBTHEMES <- list(
  taswater = list(c("water-supply", "Water supply", "_(W|RW)_|_WATER_"), c("sewer", "Sewer and other networks", ".")),
  `infrastructure-services` = list(c("electricity", "Electricity (TasNetworks)", "TASNETWORKS"),
                                   c("gas", "Gas pipelines", "GAS|ENWAVE"), c("services", "Services and regulated sites", ".")),
  `soils-agriculture` = list(c("land-use", "Land use and capability", "LAND_USE|LAND.CAPABILITY|LAND_POTENTIAL|POTENTIAL_AG"),
                             c("acid-sulfate", "Acid sulfate soils", "ACID_SULFATE"),
                             c("soil-hazards", "Soil and land hazards", "HAZARD|EROSIVITY"), c("soils", "Soils", ".")),
  `vegetation-biodiversity` = list(c("vegetation", "Vegetation mapping (TASVEG)", "TASVEG|VEGETATION"),
                                   c("fauna", "Fauna", "EAGLE|DEER|ROADKILL"), c("forests-reserves", "Forests and reserves", ".")),
  `hazards-climate` = list(c("coastal", "Coastal hazards", "COASTAL_"), c("flood", "Flood", "^TSFM_|^SES_|FLOOD"),
                           c("other-hazards", "Landslide, fire and climate", ".")),
  water = list(c("cfev", "Freshwater ecosystem values (CFEV)", "CFEV"), c("hydrography", "Hydrography", "HYD(AREA|LINE|PNT)|GROUNDWATER|RAMSAR"),
               c("management", "Water management and irrigation", ".")),
  `topography-imagery` = list(c("elevation", "Elevation and coastline", "(^|_)DEM(_|$)|CONTOURS|SPOT_HEIGHTS|COASTLINE"),
                              c("lidar", "LiDAR coverage", "LIDAR"), c("imagery-indexes", "Imagery and map indexes", ".")),
  `marine-fisheries` = list(c("fisheries", "Fisheries", "ABALONE|LOBSTER|SCALEFISH|DANISH_SEINE|RECREATIONAL_FISHING"),
                            c("kelp", "Giant kelp", "KELP|MACROCYSTIS"), c("marine-management", "Marine farming, reserves and water quality", ".")))
NODE_TITLES <- new.env()
theme_path <- function(code) {
  for (th in THEMES) if (grepl(th$re, code, perl = TRUE)) {
    if (th$id == "enterprise-suitability") { cr <- crop_of(code); assign(paste0(th$id, "/", cr), crop_title(cr), NODE_TITLES); return(c(th$id, cr)) }
    for (st in SUBTHEMES[[th$id]]) if (grepl(st[3], code, perl = TRUE)) { assign(paste0(th$id, "/", st[1]), st[2], NODE_TITLES); return(c(th$id, st[1])) }
    return(th$id)
  }
}
theme_by_id <- setNames(THEMES, vapply(THEMES, `[[`, "", "id"))

## ---- inputs --------------------------------------------------------------------------------
cat_json <- fromJSON("site/catalog.json", simplifyVector = FALSE)
sums <- read.csv(Sys.getenv("CHECKSUMS", "manifest/checksums.csv"), colClasses = "character")
sha <- setNames(sums$sha256, sums$path)
items <- cat_json$items
nosum <- vapply(items, function(it) is.na(sha[it$path]), TRUE)
if (any(nosum)) stop(sum(nosum), " files have no checksum; run R/21_checksums.R first")

## ---- helpers ------------------------------------------------------------------------------
num <- function(x) as.numeric(unlist(x))
write_json_file <- function(x, f) {
  dir.create(dirname(f), recursive = TRUE, showWarnings = FALSE)
  writeLines(toJSON(x, auto_unbox = TRUE, pretty = TRUE, null = "null", na = "null", digits = NA), f)
}
link <- function(rel, href, type, title = NULL) { l <- list(rel = rel, href = href, type = type); if (!is.null(title)) l$title <- title; l }
links <- function(...) unname(c(...))                          # always a JSON array
up <- function(n) if (n == 0) "./" else strrep("../", n)
fmt_int <- function(n) format(n, big.mark = ",", scientific = FALSE, trim = TRUE)
fmt_bytes <- function(b) { u <- c("B", "KB", "MB", "GB"); i <- max(1, min(4, floor(log(max(b, 1), 1000)) + 1)); sprintf(if (i == 1) "%.0f %s" else "%.1f %s", b / 1000^(i - 1), u[i]) }
media <- function(path) if (grepl("\\.tif$", path)) "image/tiff; application=geotiff; profile=cloud-optimized" else "application/vnd.apache.parquet"
proj_code <- function(crs) if (is.null(crs) || is.na(crs)) "EPSG:28355" else if (grepl("^(EPSG|OGC):", crs)) sub("\\+.*", "", crs) else NULL
site_link <- function(path) paste0(SITE, "#", URLencode(path, reserved = TRUE))

## bbox in lon/lat (STAC requires WGS84): densified edges through PROJ
to_lonlat <- function(bbox, crs) {
  b <- num(bbox); if (length(b) == 6) b <- b[c(1, 2, 4, 5)]
  if (length(b) != 4 || anyNA(b)) return(NULL)
  if (!is.null(crs) && !is.na(crs) && crs %in% c("OGC:CRS84", "EPSG:4326", "EPSG:4283")) return(round(b, 6))
  src <- if (is.null(crs) || is.na(crs) || startsWith(crs, "EPSG:28355")) "EPSG:28355" else crs
  t <- seq(0, 1, length.out = 21)
  x <- c(b[1] + t * (b[3] - b[1]), rep(b[3], 21), b[3] - t * (b[3] - b[1]), rep(b[1], 21))
  y <- c(rep(b[2], 21), b[2] + t * (b[4] - b[2]), rep(b[4], 21), b[4] - t * (b[4] - b[2]))
  ll <- wk_coords(wk_transform(xy(x, y), proj_trans_create(src, "OGC:CRS84")))
  if (!all(is.finite(c(ll$x, ll$y)))) return(NULL)
  round(c(min(ll$x), min(ll$y), max(ll$x), max(ll$y)), 6)
}
TAS <- c(143.5, -44.0, 148.6, -39.4)   # extent for tables with no geometry
bbox_poly <- function(b) list(type = "Polygon", coordinates = list(list(c(b[1], b[2]), c(b[3], b[2]), c(b[3], b[4]), c(b[1], b[4]), c(b[1], b[2]))))

data_asset <- function(it) {
  a <- list(href = paste0(ASSET_BASE, "/", it$path), type = media(it$path),
            title = paste0(basename(it$path), " (", c(vector = "GeoParquet", raster = "COG", table = "Parquet")[[it$kind]], ")"),
            roles = I("data"), `file:size` = it$bytes, `file:checksum` = paste0("1220", sha[[it$path]]))
  pc <- proj_code(it$crs %||% NA)
  if (it$kind != "table" && !is.null(pc)) a$`proj:code` <- pc
  if (it$kind != "table" && !is.null(it$bbox)) { b <- num(it$bbox); a$`proj:bbox` <- if (length(b) == 6) b[c(1, 2, 4, 5)] else b }
  if (it$kind == "raster" && !is.null(it$raster)) {
    d <- num(it$raster$dim); r <- num(it$raster$res); b <- num(it$bbox)
    a$`proj:shape` <- c(d[2], d[1]); a$`proj:transform` <- c(r[1], 0, b[1], 0, -r[2], b[4])
  }
  if (it$kind != "raster") {
    cols <- lapply(it$columns, function(c) list(name = c[[1]], type = c[[2]]))
    if (it$kind == "vector") cols <- c(cols, list(list(name = "geometry", type = "binary", description = "WKB"),
                                                  list(name = "geometry_bbox", type = "struct<xmin: float, ymin: float, xmax: float, ymax: float>")))
    a$`table:row_count` <- it$rows; a$`table:columns` <- cols
    if (it$kind == "vector") a$`table:primary_geometry` <- "geometry"
  }
  a
}

## ---- one collection per product ---------------------------------------------------------------
by_prod <- split(items, vapply(items, function(it) strsplit(it$path, "/")[[1]][2], ""))
make_collection <- function(prod, its) {
  its <- its[order(vapply(its, `[[`, "", "path"))]
  main <- its[[which.max(match(vapply(its, `[[`, "", "kind"), c("table", "raster", "vector"), 0))]]
  src <- main$source; title <- main$title; code <- main$product
  path <- c(theme_path(code), prod); depth <- length(path)          # collection dir depth below root
  bbs <- Filter(Negate(is.null), lapply(its, function(it) if (!is.null(it$bbox)) to_lonlat(it$bbox, it$crs %||% NA)))
  bbox <- if (length(bbs)) { m <- do.call(rbind, bbs); c(min(m[, 1]), min(m[, 2]), max(m[, 3]), max(m[, 4])) } else TAS
  released <- max(unlist(lapply(its, function(it) it$source$released)) %||% NA)
  built <- max(unlist(lapply(its, function(it) it$source$built)) %||% cat_json$generated)
  stacked <- any(grepl("stacked", vapply(its, function(it) it$source$status %||% "", "")))
  rid <- regmatches(src$status %||% "", regexpr("id [A-Za-z_]+;", src$status %||% ""))
  rid <- if (length(rid)) sub("^id ([A-Za-z_]+);$", "\\1", rid) else ""
  rows_txt <- if (!is.null(main$rows)) paste0(fmt_int(main$rows), if (main$kind == "vector") " features" else " rows") else ""
  what <- switch(main$kind,
    vector = sprintf("%s, %s (%s).", rows_txt, sub("^multi", "multi-", tolower(main$geometry %||% "vector")), main$crs %||% "EPSG:28355"),
    raster = sprintf("%s grid, %s cells, %s%s.", main$raster$dtype, paste(signif(num(main$raster$res), 6), collapse = " x "), main$crs %||% "EPSG:28355",
                     if (sum(vapply(its, `[[`, "", "kind") == "raster") > 1) sprintf("; %d grids", sum(vapply(its, `[[`, "", "kind") == "raster")) else ""),
    table  = sprintf("Attribute table, %s.", rows_txt))
  how <- if (identical(src$kind, "lga")) {
    if (stacked) sprintf("Built from the %d per-LGA LIST zips by stacking them, with an `lga` column: this layer has no feature id, so features crossing an LGA boundary stay cut there.", src$n)
    else sprintf("Built from the %d per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per %s, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file.",
                 src$n, if (nzchar(rid)) paste0("`", rid, "`") else "feature id")
  } else "Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept."
  desc <- gsub("\\s+", " ", paste(sprintf("%s: LIST product `%s`, statewide.", title, code), what, how,
                                  if (!is.null(main$crs_note)) paste0("Note: ", main$crs_note, ".") else "",
                                  sprintf("Source released %s. Data (c) State of Tasmania, CC BY 3.0 AU: cite as \"%s\" from theLIST (c) State of Tasmania.", released, title)))
  ## one item per COG only where a product has several; a single file stays a collection asset (Portolan COL-001/COL-004)
  rasters <- Filter(function(it) it$kind == "raster", its)
  if (length(rasters) < 2) rasters <- list()
  others  <- Filter(function(it) !(it$kind == "raster" && length(rasters)), its)
  assets <- setNames(lapply(others, data_asset), vapply(others, function(it) sub("\\.(parquet|tif)$", "", basename(it$path)), ""))
  thumb <- file.path(THUMBS, paste0(prod, ".png"))
  has_thumb <- file.exists(thumb)
  if (has_thumb) assets$thumbnail <- list(href = "./thumbnail.png", type = "image/png", title = paste(title, "(preview)"),
                                          roles = I("thumbnail"), `file:size` = file.size(thumb),
                                          `file:checksum` = paste0("1220", digest_sha256(thumb)))
  item_objs <- lapply(rasters, function(it) {
    iid <- sub("\\.tif$", "", basename(it$path)); b <- to_lonlat(it$bbox, it$crs %||% NA) %||% bbox
    list(id = iid, it = it, json = list(
      type = "Feature", stac_version = STAC_VERSION, stac_extensions = I(unname(EXT[c("portolan", "file", "proj")])),
      id = iid, geometry = bbox_poly(b), bbox = b,
      properties = list(title = it$layer %||% title, datetime = if (!is.na(released)) paste0(released, "T00:00:00Z") else NA,
                        updated = it$source$built %||% built),
      links = links(list(link("root", paste0(up(depth + 1), "catalog.json"), "application/json", ROOT_TITLE),
                         link("parent", "../collection.json", "application/json", title),
                         link("collection", "../collection.json", "application/json", title),
                         link("license", LICENSE_URL, "text/html", "CC BY 3.0 AU"),
                         link("alternate", site_link(it$path), "text/html", "Listing with read-in-place examples"))),
      assets = list(data = data_asset(it)), collection = prod))
  })
  col <- list(type = "Collection", stac_version = STAC_VERSION,
              stac_extensions = I(unname(EXT[c("portolan", "file", if (any(vapply(its, `[[`, "", "kind") != "table")) "proj",
                                              if (any(vapply(its, `[[`, "", "kind") != "raster")) "table")])),
              id = prod, title = title, description = desc,
              keywords = I(unique(c("Tasmania", "theLIST", code, c(vector = "vector", raster = "raster", table = "table")[[main$kind]]))),
              license = "CC-BY-3.0-AU", providers = PROVIDERS,
              extent = list(spatial = list(bbox = list(bbox)),
                            temporal = list(interval = list(list(if (!is.na(released)) paste0(released, "T00:00:00Z") else NA, NA)))),
              updated = built,
              links = links(
                list(link("root", paste0(up(depth), "catalog.json"), "application/json", ROOT_TITLE),
                     link("parent", "../catalog.json", "application/json", NULL),
                     link("describedby", "./README.md", "text/markdown", paste(title, "documentation")),
                     link("agents", "./AGENTS.md", "text/markdown", "Guidance for agents"),
                     link("license", LICENSE_URL, "text/html", "CC BY 3.0 AU"),
                     link("alternate", site_link(main$path), "text/html", "Listing with read-in-place examples (DuckDB, GDAL, R, Python, QGIS)")),
                lapply(src$zips, function(z) link("via", z$url, "text/html", paste0("Source: ", z$name, " (LIST, released ", z$released, ")"))),
                lapply(item_objs, function(o) link("item", sprintf("./%s/%s.json", o$id, o$id), "application/geo+json", o$json$properties$title))))
  if (length(assets)) col$assets <- assets
  if (main$kind == "vector") col$`table:primary_geometry` <- "geometry"
  list(collection = col, path = path, its = its, main = main, items = item_objs, thumb = if (has_thumb) thumb)
}
digest_sha256 <- function(f) sub(" .*", "", system(sprintf("sha256sum %s", shQuote(f)), intern = TRUE))

## ---- README and AGENTS for a collection --------------------------------------------------------
readme_for <- function(cl) {
  c0 <- cl$collection; m <- cl$main; https <- paste0(ASSET_BASE, "/", m$path)
  rows <- vapply(cl$its, function(it) sprintf("| `%s` | %s | %s | %s |", basename(it$path), it$kind,
    if (!is.null(it$rows)) fmt_int(it$rows) else if (!is.null(it$raster)) sprintf("%s x %s px", fmt_int(it$raster$dim[[1]]), fmt_int(it$raster$dim[[2]])) else "",
    fmt_bytes(it$bytes)), "")
  snippet <- switch(m$kind,
    vector = c("```sql", "INSTALL spatial; LOAD spatial;", sprintf("SELECT * FROM read_parquet('%s') LIMIT 10;", https), "```", "",
               "```sh", sprintf("gdal vector info --summary /vsicurl/%s", https), "```"),
    raster = c("```sh", sprintf("gdal raster info /vsicurl/%s", https), "```", "", "```python", "import rasterio", sprintf("src = rasterio.open(\"%s\")", https), "```"),
    table  = c("```sql", sprintf("SELECT * FROM read_parquet('%s') LIMIT 10;", https), "```"))
  cols <- if (!is.null(m$columns)) c("## Columns", "", paste(vapply(m$columns, function(c) sprintf("`%s` (%s)", c[[1]], c[[2]]), ""), collapse = ", "), "") else NULL
  c(sprintf("# %s", c0$title), "", c0$description, "", "## Files", "", "| file | kind | size | bytes |", "|---|---|---|---|", rows, "",
    "## Read it in place", "", snippet, "", sprintf("More examples (R, Python, QGIS) and column types: %s", site_link(m$path)), "", cols,
    "## Source", "", vapply(m$source$zips, function(z) sprintf("- [%s](%s), released %s", z$name, z$url, z$released), ""), "",
    "## Attribution", "", sprintf("\"%s\" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.", c0$title))
}
agents_for <- function(cl) {
  m <- cl$main; c0 <- cl$collection; depth <- length(cl$path)
  c(sprintf("# Agents: %s (`%s`)", c0$title, m$product), "",
    sprintf("General guidance for this catalogue: [AGENTS.md](%sAGENTS.md).", up(depth)), "",
    "- Read in place; the data files are listed under `assets` in `collection.json`" , if (length(cl$items)) "  and, for rasters, on one item per COG (`links` with rel `item`)." else "",
    "- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.",
    if (m$kind != "raster") sprintf("- `table:columns` lists the columns and types; `table:row_count` = %s.", fmt_int(m$rows %||% 0)) else "",
    if (m$kind == "vector") "- Filter on the `geometry_bbox` column to read only the row groups you need." else "",
    if (m$kind == "raster") "- COGs have internal overviews; read a window or an overview, not the full grid." else "",
    sprintf("- Native CRS: %s. %s", m$crs %||% "EPSG:28355 (not recorded in the file)", m$crs_note %||% ""),
    if (identical(m$source$kind, "lga")) "- Built from the per-LGA LIST zips; the `lga` column names the source LGA(s). See the collection description." else "",
    sprintf("- Attribution required: \"%s\" from theLIST (c) State of Tasmania (CC BY 3.0 AU).", c0$title))
}

## ---- build ------------------------------------------------------------------------------------
unlink(STAC_OUT, recursive = TRUE)
cls <- Map(make_collection, names(by_prod), by_prod)
for (cl in cls) {
  d <- do.call(file.path, as.list(c(STAC_OUT, cl$path)))
  write_json_file(cl$collection, file.path(d, "collection.json"))
  writeLines(readme_for(cl), file.path(d, "README.md"))
  writeLines(Filter(nzchar, agents_for(cl)), file.path(d, "AGENTS.md"))
  if (!is.null(cl$thumb)) invisible(file.copy(cl$thumb, file.path(d, "thumbnail.png"), overwrite = TRUE))
  for (o in cl$items) write_json_file(o$json, file.path(d, o$id, paste0(o$id, ".json")))
}

## catalogs for every theme node, bottom up
node_paths <- unique(unlist(lapply(cls, function(cl) { p <- head(cl$path, -1); lapply(seq_along(p), function(i) paste(p[1:i], collapse = "/")) })))
node_title <- function(np) { p <- strsplit(np, "/")[[1]]; if (length(p) == 1) theme_by_id[[p]]$title else get(np, NODE_TITLES) }
node_desc <- function(np) {
  p <- strsplit(np, "/")[[1]]
  if (length(p) == 1) theme_by_id[[p]]$description
  else if (p[1] == "enterprise-suitability") sprintf("Enterprise suitability for %s: current and scenario grids or layers.", tolower(node_title(np)))
  else sprintf("%s: %s.", theme_by_id[[p[1]]]$title, node_title(np))
}
for (np in node_paths) {
  p <- strsplit(np, "/")[[1]]; depth <- length(p)
  kids_sub <- setdiff(unique(vapply(cls, function(cl) { cp <- head(cl$path, -1); if (length(cp) > depth && identical(cp[1:depth], p)) paste(cp[1:(depth + 1)], collapse = "/") else "" }, "")), "")
  kids_col <- Filter(function(cl) identical(head(cl$path, -1), p), cls)
  kids_col <- kids_col[order(vapply(kids_col, function(cl) cl$collection$title, ""))]
  n <- length(kids_sub) + length(kids_col)
  ttl <- node_title(np); parent_title <- if (depth == 1) ROOT_TITLE else node_title(paste(p[1:(depth - 1)], collapse = "/"))
  cat_obj <- list(type = "Catalog", stac_version = STAC_VERSION, stac_extensions = I(EXT[["portolan"]]),
                  id = gsub("/", "-", np), title = ttl,
                  description = sprintf("%s %d %s.", node_desc(np), n, if (length(kids_sub)) "groups" else "collections"),
                  links = links(list(link("root", paste0(up(depth), "catalog.json"), "application/json", ROOT_TITLE),
                                     link("parent", "../catalog.json", "application/json", parent_title),
                                     link("describedby", "./README.md", "text/markdown", paste(ttl, "documentation")),
                                     link("agents", "./AGENTS.md", "text/markdown", "Guidance for agents")),
                                lapply(sort(kids_sub), function(k) link("child", sprintf("./%s/catalog.json", basename(k)), "application/json", node_title(k))),
                                lapply(kids_col, function(cl) link("child", sprintf("./%s/collection.json", cl$collection$id), "application/json", cl$collection$title))))
  d <- file.path(STAC_OUT, np)
  write_json_file(cat_obj, file.path(d, "catalog.json"))
  writeLines(c(sprintf("# %s", ttl), "", cat_obj$description, "",
               vapply(sort(kids_sub), function(k) sprintf("- [%s](./%s/README.md)", node_title(k), basename(k)), ""),
               vapply(kids_col, function(cl) sprintf("- [%s](./%s/README.md)", cl$collection$title, cl$collection$id), "")), file.path(d, "README.md"))
  writeLines(c(sprintf("# Agents: %s", ttl), "", sprintf("A grouping of collections; see [AGENTS.md](%sAGENTS.md) for how to read the data, CRS notes and attribution.", up(depth))),
             file.path(d, "AGENTS.md"))
}
## parent link titles for collections
for (cl in cls) {
  f <- file.path(do.call(file.path, as.list(c(STAC_OUT, cl$path))), "collection.json")
  x <- fromJSON(f, simplifyVector = FALSE)
  x$links <- lapply(x$links, function(l) { if (l$rel == "parent") l$title <- node_title(paste(head(cl$path, -1), collapse = "/")); l })
  write_json_file(x, f)
}
top <- intersect(vapply(THEMES, `[[`, "", "id"), unique(vapply(cls, function(cl) cl$path[1], "")))
root <- list(type = "Catalog", stac_version = STAC_VERSION, stac_extensions = I(EXT[["portolan"]]),
             id = "thelist-opendata", title = ROOT_TITLE,
             description = paste("Every statewide dataset from the LIST (Tasmania) open data bulk downloads, as GeoParquet and Cloud Optimized GeoTIFF on Source Cooperative, read in place over HTTPS or S3.",
                                 "Where LIST ships a product only as 29 per-LGA zips, the statewide file is built from them, with features clipped at LGA boundaries rejoined.",
                                 sprintf("%d products in %d themes. Data (c) State of Tasmania, CC BY 3.0 AU.", length(cls), length(top))),
             links = links(list(link("root", "./catalog.json", "application/json", ROOT_TITLE),
                                link("describedby", "./README.md", "text/markdown", "About this catalogue"),
                                link("agents", "./AGENTS.md", "text/markdown", "Guidance for agents"),
                                link("license", LICENSE_URL, "text/html", "CC BY 3.0 AU"),
                                link("alternate", SITE, "text/html", "Listing with read-in-place examples"),
                                link("via", "https://listdata.thelist.tas.gov.au/opendata/data/", "text/html", "LIST open data bulk downloads (the source)")),
                           lapply(top, function(t) link("child", sprintf("./%s/catalog.json", t), "application/json", theme_by_id[[t]]$title))),
             updated = cat_json$generated)
write_json_file(root, file.path(STAC_OUT, "catalog.json"))
invisible(file.copy(c("store/stac/README.md", "store/stac/AGENTS.md"), STAC_OUT, overwrite = TRUE))
## product -> collection path, for the listing site's links into the catalogue
paths <- setNames(lapply(cls, function(cl) paste(c(cl$path, "collection.json"), collapse = "/")), vapply(cls, function(cl) cl$collection$id, ""))
writeLines(toJSON(paths, auto_unbox = TRUE), Sys.getenv("STAC_PATHS", file.path(dirname(STAC_OUT), "stac-paths.json")))
tab <- table(vapply(cls, function(cl) cl$path[1], ""))
message("wrote ", STAC_OUT, ": ", length(cls), " collections, ", sum(lengths(lapply(cls, `[[`, "items"))), " raster items; ",
        paste(sprintf("%s %d", names(tab), tab), collapse = ", "))

# Cloudifying a data collection: a playbook

How this repository turned the LIST (Tasmania) open data bulk downloads, about
1700 zips of FileGDB, shapefile and MapInfo, into a cloud-native collection:
GeoParquet and COG read in place, a listing site, a STAC catalogue in the
Portolan profile, thumbnails and map tiles. It is written for the next
collection: Antarctic data, [banksia](https://github.com/mdsumner/banksia), or
anything else. Each step says what we did, which script does it here, and what
went wrong on the way, because most of the useful knowledge is in the last part.

Contents: [Checklist](#checklist) · [Principles](#principles) ·
[1 Map the source](#1-map-the-source) · [2 Convert](#2-convert) ·
[3 Make it whole](#3-make-it-whole) · [4 Publish](#4-publish) ·
[5 Describe it](#5-describe-it) · [6 Catalogue it (STAC, Portolan)](#6-catalogue-it-stac-portolan) ·
[7 Show it](#7-show-it) · [8 Keep it fresh](#8-keep-it-fresh) ·
[Antarctic and polar data](#antarctic-and-polar-data) ·
[National, multi-source collections (banksia)](#national-multi-source-collections-banksia) ·
[Small traps](#small-traps) · [Reusing these scripts](#reusing-these-scripts)

## Checklist

1. Crawl the source into a manifest; record every file's size, mtime and etag.
2. Peek every layer (driver, geometry type, feature count, CRS, extent) before converting anything.
3. Convert each layer once: GeoParquet 1.1 (bbox covering, sorted) or COG. Keep the native CRS.
4. Check every output has a CRS in its metadata.
5. If the source is split into tiles or regions, build one whole-area file and say exactly how.
6. Log every output against its source etag; re-runs redo only what changed.
7. Publish to object storage; verify from the public side (size, range reads, CORS, header bytes).
8. Hash every published file once (sha256), cached by path + size + mtime.
9. List what is actually in the store (read footers, not the manifest), with read-in-place examples for every tool.
10. Generate STAC (Portolan profile) from that listing; validate with `portolan check`.
11. Thumbnails for every geospatial collection; PMTiles for layers too big to draw directly.
12. Automate the refresh; keep credentials and versioning limits in mind.

## Principles

- **One place.** The mirror, the whole-area layers, the catalogue and the site live
  in one project and one store. Derived layers sit beside the source-shaped ones
  (`<product>/statewide/` beside `<product>/<lga>/`), so users find everything in
  one tree.
- **The listing is the source of truth.** Everything downstream is derived from a
  crawl of what the custodian publishes, and every output traces to a source URL
  and etag (`manifest/converted.csv`).
- **Straight conversion first, then one documented step.** Field names and types
  as the source has them; the only edits are the ones you write down (here: the
  LGA rejoin, CRS assignment for unnamed WKT, multi promotion).
- **Native CRS.** Store in the source CRS; describe it in lon/lat only in metadata
  (STAC extents). Reprojection is the reader's choice, except where a collection
  must share one CRS (see banksia).
- **Read in place.** Nothing a user needs requires downloading a whole file:
  GeoParquet with a bbox covering column and sorted rows, COG with overviews,
  PMTiles for maps.
- **Verify from the outside.** Every claim ("uploaded", "conforms", "renders") was
  checked against the public URL, not the local copy.
- **Equal coverage of tools.** DuckDB, GDAL, R, Python and QGIS each get a real
  example; "cloud-ready" means different things in each, and none should be
  second class.

## 1 Map the source

Scripts: `R/00_crawl.R` (listing, HEAD for size/mtime/etag), `R/01_parse.R`
(product and region from file names), `R/02_peek.R` (every layer in every zip
through `/vsizip//vsicurl/`, no download).

- A plain directory listing (Apache `mod_autoindex`) is a perfectly good API.
  Parse it, keep it as `manifest/index.csv`, test the parser against a saved copy.
- Peek before converting. `manifest/layers.csv` (driver, geometry type, feature
  count, CRS, extent per layer) found empty FileGDBs beside full shapefiles, zips
  holding the wrong product, and the split-by-region structure, all before any
  conversion ran.
- Prefer the richest source format per layer (here gdb > shp > tab), but skip
  one whose peek errored or reported 0 features.

## 2 Convert

Script: `R/03_convert.R` (GDAL >= 3.11 unified CLI, `gdal vector pipeline`,
`gdal raster convert`).

Vector to GeoParquet:

    read --layer L <src> ! set-geom-type --multi --linear ! write --of Parquet
      --lco COMPRESSION=ZSTD --lco ROW_GROUP_SIZE=65536 --lco GEOMETRY_ENCODING=WKB
      --lco WRITE_COVERING_BBOX=YES --lco SORT_BY_BBOX=YES --lco GEOMETRY_NAME=geometry

- `SORT_BY_BBOX` plus the covering column is what makes spatial filters prune row
  groups for DuckDB, GeoPandas and GDAL.
- GeoParquet has no curves (linearise) and no M (drop it, keep Z).
- Coded-value domains with a null description break the Arrow dictionary writer;
  bounce those layers through FlatGeobuf.
- **CRS:** keep the source CRS. Where the source has an unnamed ESRI WKT, assign
  the EPSG code only when it is provably the same (`srs_is_same`) and the extent
  fits; never reproject silently. Then **check every output has a CRS in its
  `geo` metadata**: one file here (TASVEG 2.0) came out without one, and every
  GeoParquet reader then assumes lon/lat for metre coordinates.

Raster to COG: `--co COMPRESS=ZSTD --co BLOCKSIZE=512 --co BIGTIFF=IF_SAFER`,
`PREDICTOR=YES` for 16-bit and float, `RESAMPLING=NEAREST` for overviews of class
grids. When the input is a mosaic VRT, add `OVERVIEWS=IGNORE_EXISTING`, or the COG
inherits the sources' few overview levels.

## 3 Make it whole

Script: `R/04_statewide.R`. Many custodians split a product by region (here 29
local government areas). Users want one file. Find out how the split was made
before combining:

- **Measure it.** Group by the feature id across region files: an id in several
  files with *different* bboxes was clipped; with the *same* bbox it was copied
  whole (boundary features, sometimes reversed). Here both happened, in the same
  products.
- **Check attributes are identical across pieces** before rejoining (they were, in
  every layer checked).
- **Rejoin by family:** polygons unioned; lines deduplicated on *normalised*
  geometry (copies can be reversed; a reversed copy merged with its original makes
  a there-and-back line of twice the length) then a directed line merge; points
  kept once. Recompute derived lengths and areas for rejoined rows; keep the
  custodian's own `COMP_LEN`/`COMP_AREA`.
- **Verify against the custodian's measures:** rejoined features off their
  recorded length or area should be no more frequent than whole ones. Where they
  are, find out why: here, parts over open water lie outside every region, so
  they are in no source file (the middle of bridges).
- Layers with no feature id cannot be rejoined: stack them, and say they are
  still cut at region boundaries.
- Regionally tiled rasters: mosaic (`gdal raster mosaic`), honouring each tile's
  own nodata (they differed here: -9999 and 3.4e38).

## 4 Publish

Source Cooperative (`data.source.coop`) here; the same applies to any S3 store.

- **Verify from the public side** after every upload: content length equals the
  local size, range requests work, CORS is open, and the first bytes are what the
  format says (`PMTiles`, `PAR1`, a TIFF header).
- **Credentials:** keys may be short-lived (about an hour here); upload in that
  window and re-run `aws s3 sync` after transient errors (HTTP 520 on UploadPart
  happened; sync resends only what is missing). Copy-pasted credential blocks can
  carry their own `[profile]` header and leave yours empty.
- **No object versioning:** a refresh overwrites in place, so record the source
  etag of every output, and date snapshots that must not move.
- **DuckDB and dotted bucket names:** `s3://us-west-2.opendata.source.coop/...`
  needs `SET s3_url_style = 'path'` (virtual-host style breaks TLS on the dots).
  Prefer HTTPS URLs in examples.
- **Checksums:** hash every published file once (`R/21_checksums.R`; 17 GB here),
  cached by path + size + mtime so later runs hash only changes.

## 5 Describe it

Scripts: `R/20_catalog.R` (builds `site/catalog.json`), `site/` (static page,
no dependencies), GitHub Pages.

- Build the listing from **the store, not the manifest**: an anonymous S3 listing
  for files and sizes, Parquet footers for rows, columns and types
  (`parquet_file_metadata`, `parquet_schema`, `parquet_kv_metadata` over a glob,
  one call each), GDAL headers for rasters. Comparing the store's own listing
  with the conversion log found five files the log called converted that were
  not in the store.
- Every dataset gets copy-ready URLs (HTTPS, S3, `/vsicurl/`) and an example per
  tool, each with a real spatial window (a 10 km box where the data is), so the
  example demonstrates the cloud-native part, not only the read:
  DuckDB filtering on the bbox column, `gdal vector filter --bbox`, gdalraster
  `setSpatialFilterRect` then `wk::wkb()` (plots, and feeds geos as is),
  GeoPandas `read_parquet(bbox=)`, rasterio `from_bounds`, QGIS steps.
- A static site on Pages needs no store credentials, is versioned, and updates in
  the refresh PR. Link it from the store README (which Source Cooperative renders)
  and the product summary.

## 6 Catalogue it (STAC, Portolan)

Scripts: `R/22_stac.R` (from `site/catalog.json`, checksums, thumbnails, tiles),
then `portolan stac-geoparquet`. Validate: `portolan check --metadata
--data-scope local site/stac` (portolan-cli, which runs the rashid validator).

What the Portolan profile asked of this catalogue, learned from the validator:

- STAC 1.1.0 and the Portolan schema URI in `stac_extensions` on every object.
- A `README.md` (`rel: describedby`) and an `AGENTS.md` (`rel: agents`) **in every
  catalog and collection directory**. Write the root AGENTS.md for real: how to
  read without downloading, CRS caveats, what derived layers mean, attribution.
- No `self` links; structural links relative, typed, and child/item links titled.
- Providers: a `producer` and a `host` with a URL, the host last.
- Every asset has a media type, roles, `file:size` and `file:checksum`
  (sha2-256 multihash, `1220` + hex). Absolute hrefs must be HTTPS, so a
  catalogue can live apart from the data (here on Pages, assets in the store).
- `via` links typed `text/html`; licence an SPDX id (`CC-BY-3.0-AU`).
- Single-file collections carry the data at collection level; several COGs in one
  collection become one item each, plus an `items.parquet` mirror.
- No catalog with more than about 20 children: group by theme (two levels here).
- A thumbnail for every geospatial collection.
- `table:columns` and `table:row_count` let an agent plan a query without opening
  the file; `proj:code`, `proj:bbox` (and `proj:shape`, `proj:transform` for
  rasters) carry the native grid.
- STAC extents are lon/lat: transform densified edges, and **check whether a pole
  is inside** (see [Antarctic](#antarctic-and-polar-data)).

The hosted [Portolan Browser](https://browser.portolan-sdi.org) opens any
catalogue by URL (`#/external/<host>/<path>`), reads GeoParquet in the browser
for a data preview, and draws maps.

## 7 Show it

Thumbnails (`R/23_thumbnails.R`): one PNG per geospatial product, redrawn only
when its file's sha256 changes.

- Vectors: read only the geometry column (DuckDB column projection over HTTPS) and
  burn it with [controlledburn](https://github.com/hypertidy/controlledburn), which
  gives exact polygon coverage as interior runs and boundary cells without a pixel
  grid. Draw interiors pale and boundaries by density, scaled to the layer's own
  95th percentile.
- A coverage with a boundary in nearly every cell (vegetation, land use, parcels)
  reads as a solid block; detect that (over 60% of data cells near full ink) and
  draw each feature's bounding box as an outline instead, which shows where
  features are small and many.
- Rasters: one decimated read from the COG overviews; viridis for continuous,
  categorical for class grids (treat a value on all four corners as background
  when nodata is unset), RGB for imagery.

Map tiles (`R/24_pmtiles.R`):

- The Portolan Browser draws a GeoParquet directly up to **10,000 features and
  50 MB**, reprojecting from its CRS. Smaller layers need nothing more. Larger ones
  need PMTiles (81 of 235 here).
- GDAL writes PMTiles straight from GeoParquet (`write --of PMTiles`, MINZOOM,
  MAXZOOM, SIMPLIFICATION, MAX_SIZE). Choose a minimum zoom per layer: dense layers
  at low zoom lose sub-pixel features, which is fine for display; check feature
  counts per zoom against the source. tippecanoe is better at low zooms if you
  have it.
- Portolan wants a `rel: pmtiles` link with `pmtiles:layers`, a `visual` asset,
  and a MapLibre style asset (`roles: [style, default]`).
- The browser builds its legend from the style's match values: put readable
  category names in the tiles (derive them in the tiling pipeline), not codes.
- Link tiles into the catalogue only once they are live (HEAD the URL), so the
  catalogue never points at a missing file.

## 8 Keep it fresh

`.github/workflows/refresh.yml`: crawl, convert what changed (etag), rebuild the
whole-area layers whose sources changed, sync, then rebuild the listing,
checksums, thumbnails, tiles and catalogue, validate, and open a PR. Every step
is incremental. Unsolved here: CI needs a long-lived store key; with one-hour keys
the workflow has to run by hand.

## Antarctic and polar data

What changes near a pole, checked against this repository's code:

- **Store in a polar projection.** EPSG:3031 (WGS 84 / Antarctic Polar
  Stereographic) is the common one; NSIDC sea ice products use EPSG:3976 (and the
  older Hughes-ellipsoid EPSG:3412). Never store polar data in lon/lat.
- **Lon/lat extents must include the pole.** Transforming the edges of a native
  bbox misses a pole inside it. For an Antarctica-sized box
  (`-3e6, -3e6, 3e6, 3e6` in EPSG:3031) the edges alone gave
  `[-174.3, -62.9, 180, -52.3]`, which leaves out everything south of 62.9°S.
  `to_lonlat()` in `R/22_stac.R` now transforms each pole into the native CRS and,
  if it falls inside the box, widens the extent to `[-180, -90, 180, ...]`.
  STAC item geometries for a polar cap: a lon/lat polygon from -180 to 180 down to
  -90, not the transformed bbox ring.
- **The antimeridian.** Footprints crossing 180° need a STAC bbox with west > east,
  and GeoJSON geometries split at 180° (RFC 7946).
- **Web Mercator stops at 85.0511°.** PMTiles and vector tiles, MapLibre, and so
  the Portolan Browser's map, cannot show the interior beyond about 85°S, and
  distort everything near it. Plan previews accordingly: thumbnails drawn in the
  native polar CRS (the controlledburn approach is CRS-agnostic; supply a polar
  coastline for the background), COGs viewed in QGIS or an OpenLayers map in
  EPSG:3031, and PMTiles only for the parts of a collection that sit north of the
  limit.
- **Coastlines move.** Ice shelves calve and grounding lines are revised: date
  snapshots, keep the source release with every output, never overwrite a dated
  version.
- **Multidimensional data.** Much Antarctic data is NetCDF/HDF time series; COG is
  for 2D grids. For cubes, GDAL's multidimensional API, or virtual Zarr references
  over the existing files, keep the read-in-place property without copying.

## National, multi-source collections (banksia)

- **One CRS by design.** A union across jurisdictions needs one CRS (banksia uses
  GDA2020, EPSG:7844); record each source's original CRS, and check the
  reprojection: every coordinate finite, every row present. (An earlier transform
  here through sf silently passed rows through untransformed; PROJ through
  `wk_transform` did not.) The GDA94 to GDA2020 step is about 1.8 m and depends on
  the transformation PROJ picks: make it explicit.
- **Partitioned outputs.** Hive partitions (`state=XX/`) map to one STAC
  collection with Portolan's partition extension
  (`https://schemas.portolan-sdi.org/incubating/partition/v1.0.0/schema.json`;
  `partition:scheme`, `partition:keys`, `partition:glob`), not an item per file.
- **Tasmania.** banksia's Tasmanian partition reads the 29 per-council files:
  434,126 rows, which counts each of the 276 parcels LIST clipped at council
  boundaries once per piece. The rejoined statewide file here has 433,845 unique
  parcels, one row per `LIST_GUID`, with an `lga` column:
  `https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/statewide/list_parcels_statewide.parquet`
  (EPSG:28355; reproject to 7844 as for the other states).
- Each source's quirks (paging, sort keys, field names) belong in a survey
  document like banksia's `docs/sources.md`, with a row per source in a CSV that
  drives the harvest, which is the same idea as the manifest here.

## Small traps

- DuckDB: `nulls` and `groups` are reserved words (alias columns); GeoParquet
  geometry arrives as a native `GEOMETRY` type unless
  `SET enable_geoparquet_conversion = false` (keep it WKB when mixing with
  blobs from R); the primary geometry column is not always `geometry` (read it
  from the `geo` metadata: files from bare FileGDBs had `SHAPE`).
- GDAL: `select --fields` drops the geometry in recent versions; name it
  (`--field X --geometry-field geometry`). The PMTiles reader calls the geometry
  `geom`. Mosaic VRTs pass through source overviews (use `IGNORE_EXISTING`).
- R: `pmin()` drops matrix dimensions; `rbind()` turns numbers into strings (a
  MapLibre match on `"10"` never matches `10`); `wk::wkb()` wants a plain list of
  raw (strip attributes); `getFieldNames()` in gdalraster includes the geometry,
  so ignoring all fields ignores it too.
- JSON from R: unnamed lists become arrays; a list built with `lapply()` over
  named input becomes an object (`unname()` it).
- Headless browsers often fail to draw WebGL maps: check the page's DOM (style
  loaded, map canvas present) and look in a real browser before concluding a map
  is broken.

## Reusing these scripts

The scripts are reference implementations, not a package. What is specific to
this collection:

- `R/00_crawl.R` to `R/02_peek.R`: the LIST listing and its file naming.
- `R/03_convert.R`: the CRS assignment rule (MGA zone 55), source preference.
- `R/04_statewide.R`: the region set (LGAs), the feature id per layer (`ID_COLS`).
- `R/20_catalog.R`: the store URLs, title acronyms, the Tasmania outline and MGA
  frame for the locator map.
- `R/22_stac.R`: themes and subthemes (regexes on product codes), providers,
  licence, the fallback extent for tables.
- `R/23_thumbnails.R`: the background outline (a polar collection needs its own,
  in its own CRS).
- `R/24_pmtiles.R`: which layers get tiles, fields, zooms, palettes.

Everything else (checksums, the listing site, STAC structure, thumbnails,
validation, the refresh workflow) carries over as is.

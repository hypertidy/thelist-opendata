# thelist-opendata

Reproducible, from-scratch map and mirror of the LIST (Tasmania) open data bulk
downloads at https://listdata.thelist.tas.gov.au/opendata/data/

NOTE: new approach taken for entire nation here: https://github.com/mdsumner/banksia

## Where the mirror lives

Published on Source Cooperative: https://source.coop/mdsumner/thelist-opendata

    https://data.source.coop/mdsumner/thelist-opendata/<path>                 (HTTP, CORS open, range requests)
    s3://us-west-2.opendata.source.coop/mdsumner/thelist-opendata/<path>      (anonymous S3, AWS_NO_SIGN_REQUEST=YES)

The store's own README (`README.md` at the root of the product) has the
attribution wording, licence and reading examples for DuckDB, GDAL, R and
Python. The full catalogue, including the conversion log `converted.csv`, is
under `manifest/` in the store.

Current snapshot: crawled 2026-09-10, converted 2026-09-17, uploaded
2026-10-13 (geoparquet 12.7 GiB, cog 7.3 GiB, parquet 0.02 GiB).

### Known gaps in the published snapshot

- `raw/` (the source zips, 183 GB) is not uploaded, although the store README
  describes it.
- The stale `municipality_<lga>` copies inside product folders (1275
  parquets plus 47 `municipality_union.vrt`) were deleted from the store on
  2026-11-07 and their 1276 rows pruned from `converted.csv`; boundaries now
  live only under `geoparquet/municipality/`.
- Raster output paths changed since the snapshot (`cog/<product>/<region>/`),
  so about 30 logged outputs are not at their logged path and about 24 store
  files are not in the log.
- 14 source zips are not converted: the 2 m CHM and slope rasters (need
  `SRC_ROOT`), the known empty or odd zips listed below, and
  INTERIM_PLANNING_SCHEME_OVERLAY_STATEWIDE, SES_DESIGN_FLOOD_EVENT_STATEWIDE,
  LIST_SHELLMAP_HARVEST_AREA_BOUNDARIES_STATEWIDE and
  LIST_TREE_CANOPY_HEIGHT_STATEWIDE (to check).
- Source Cooperative has no object versioning, so each refresh overwrites in
  place. `converted.csv` records the source etag behind every output.

## Refresh

`.github/workflows/refresh.yml` re-runs the pipeline monthly (and on demand):
crawl, parse, peek, then convert only what changed upstream (etag skip, using
the store's `manifest/converted.csv` as the log), then syncs new outputs and
the manifest to the store. It needs repository secrets for a Source
Cooperative service account (see the workflow header).

The store READMEs are kept in `store/<product>/README.md` and uploaded by hand.

## Derived products

Anything built *from* the mirror goes in its own product, so the mirror stays
a straight conversion.

- https://source.coop/mdsumner/tas-transport-web: LIST_TRANSPORT_SEGMENTS as
  one statewide browser layer (EPSG:4326, clipped LGA pieces rejoined to one
  row per TRANSEG_ID, integer `node0`/`node1`, Hilbert-sorted GeoParquet plus
  PMTiles). Built by `R/10_transport_web.R` from the mirror's GeoParquet, into
  dated snapshot folders that are never overwritten, plus `latest.json`. See
  `store/tas-transport-web/README.md`. Upload:

      WEB_OUT=out_web Rscript R/10_transport_web.R
      aws --endpoint-url https://data.source.coop s3 cp --recursive out_web/ s3://mdsumner/tas-transport-web/


## What the source actually is

There is no API and no catalogue page worth scraping. `/opendata/` is a static
landing page; the data lives at `/opendata/data/`, which is a plain Apache
`mod_autoindex` directory listing (2109 rows, 183 GiB, as of 2026-09-10):

- 1684 `PRODUCT_REGION.zip` files. REGION is `STATEWIDE` or one of the 29
  Tasmanian LGAs (tokenised uppercase with underscores, e.g. `WEST_COAST`,
  `HUON_VALLEY`, `GLAMORGAN_SPRING_BAY`).
- a few loose shapefile / MapInfo components (`interim_planning_scheme_overlay_statewide.*`),
  one `data.7z`, and six subdirectories: two exposed `.gdb/` folders (which
  account for most of the non-zip rows) and four product folders that hold
  further gdbs and loose files.
- sizes range from a few KB to 24 GB (`CHM_2M_STATEWIDE.zip`); mtimes from
  2016 to the present, so mtime + size is the change-detection key.

The listing is the source of truth. Everything downstream is derived from it.

## Pipeline

    Rscript R/00_crawl.R      # listing  -> manifest/index.csv     (url, bytes, mtime; exact via HEAD)
    Rscript R/01_parse.R      # index    -> manifest/files.csv     (+ product, region, region_type)
    Rscript R/02_peek.R       # files    -> manifest/layers.csv    (inside each zip, no download)
    Rscript R/03_convert.R    # layers   -> object storage as GeoParquet / COG (streams from URL)

Each step reads only the previous step's CSV and the network, so any step can be
re-run in isolation and the CSVs can be committed to git to leave a trail.

Step 02 uses GDAL's `/vsizip//vsicurl/` to read zip central directories and
layer metadata over HTTP range requests, so the "what is in the zips" map is
built without downloading them. Step 03 uses the same path for `gdal vector pipeline`, so a
conversion is a single command from the public URL to the bucket with nothing
unpacked locally. If you would rather fetch the zips first (bowerbird), point
`SRC_ROOT` in `03_convert.R` at the local mirror and it will use `/vsizip/`
on local files instead; the recipe is otherwise identical.

## Requirements

- R >= 4.2 with `httr2`, `jsonlite`, `gdalraster`
- GDAL >= 3.11 on PATH (the unified `gdal` CLI, plus `ogrinfo`/`gdalinfo` for
  the peek) built with the
  Arrow/Parquet driver (`ogrinfo --formats | grep -i parquet`); the
  ghcr.io/osgeo/gdal images and conda-forge libgdal-arrow-parquet have it
- for step 03: credentials for the target object store in the usual GDAL
  environment variables (`AWS_*` / `AZURE_*` / `GS_*`), see
  https://gdal.org/user/virtual_file_systems.html

## What the peek found (2026-09-10)

- 1684 zips, 2109 index rows, 183 GiB. Nearly every vector zip carries the
  same layer three ways: a FileGDB (one feature class per .gdb), a shapefile
  and a MapInfo .tab, plus readme.txt and ESRI .shp.xml metadata.
  gdb is the conversion source; shp is the fallback.
- 116 gdb-only zips are the NCH / Enterprise Suitability products: raster
  FileGDBs (GDAL >= 3.7 reads them via OpenFileGDB), converted to COG.
- CHM 2 m and Slope 2 m statewide rasters ship as TIFFs inside 8-24 GB zips
  (with older versions nested under Old/); converted only from a local copy.
- CRS is EPSG:28355 almost everywhere; a handful carry unidentified ESRI WKT
  naming MGA55 (assigned 28355 when the extent agrees), a few are compound
  with AHD height, 2 are EPSG:3857, 1 is EPSG:4326.
- 44 zips hold nothing GDAL opens: ESRI layer-file bundles, LGA_CDC* xls
  repositories, a CSV product and Python.zip. They are in contents.csv and
  the raw copy only.

Known oddities upstream (worth reporting to Land Tasmania):

- Empty FileGDBs (system tables only) beside a full shapefile: CFEV river
  section catchments Clarence and Derwent Valley (no shapefile either),
  Enwave gas pipeline corridor, coastal erosion Meander Valley, 2050 storm
  tide Dorset and Kingborough, EPA regulated sites documents, landslide
  planning map components Meander Valley / Sorell / Waratah-Wynyard,
  NCH ES blueberries, TasWater sewer laterals, NCH_ES_BARLEY_V2.
- LIST_LAND_USE_2013_BRS_GLAMORGAN_SPRING_BAY: gdb has 0 features, shp 9900.
- NCH_ES_WHEAT_STATEWIDE.zip contains NCH_ES_WHEATNCH_ES_BARLEY_2030_A2.gdb.
- Python.zip contains Temp/opendata/NCH_ES_BLUEB_NHIGHBUSH_V2.gdb.
- 43 of 2674 gdb/shp layer pairs differ in feature count by 1-13 either way;
  both counts are in layers.csv.

## Conventions

- Text output only, ASCII only, one row per thing, stable column order.
- Nothing is materialised that can be derived; the manifest is the payload.
- Statewide products are one file; LGA-split products are converted per LGA and
  then a union per product is written alongside, so both granularities exist.
- The LGA boundary shipped in every zip (municipality_<lga>) is converted once,
  as its own product, not 1277 times.
- Vector output is GeoParquet from the gdb source: field names and types as in
  the gdb (Int16, DateTime), geometries promoted to MULTI, curves (CurvePolygon,
  MultiSurface) linearised since GeoParquet has no curve types. Coded-value
  field domains are not carried: Parquet has no place for them, and the Arrow
  writer cannot emit a domain with a null description (LAND_USE_2019_BRS,
  POTENTIAL_AG_LAND go through a FlatGeobuf hop for that reason, see
  converted.csv status). The domain tables themselves are in the gdb in raw/.
- Raster output is COG, ZSTD, 512 blocks; Byte class grids get NEAREST
  overviews, continuous data the COG default. Raster FileGDBs (NCH) carry no
  colour table through OpenFileGDB, but their attribute tables come out as
  non-spatial layers in parquet/.

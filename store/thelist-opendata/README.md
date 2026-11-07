# LIST open data, Tasmania - cloud-native mirror

GeoParquet and Cloud Optimized GeoTIFF copies of the Land Tasmania LIST open
data bulk downloads (https://listdata.thelist.tas.gov.au/opendata/data/),
with a manifest describing every source file and the etag each output was
built from. The original zips are not mirrored; fetch them from the source.

Data: (c) State of Tasmania, Creative Commons Attribution 3.0 Australia.
Code that built this: https://github.com/hypertidy/thelist-opendata (MIT).

## Attribution

Land Tasmania asks for this form, and it applies to everything here whether you
use the GeoParquet, the COGs or the source zips:

    "<dataset name>" from theLIST © State of Tasmania

for example `"LIST Parcels" from theLIST © State of Tasmania`. Land Tasmania
does not endorse this mirror or any use of it. Some datasets are published
through the LIST on behalf of other custodians (TasWater, TasNetworks, EPA
Tasmania, Natural Resources and Environment Tasmania and others); the
`readme.txt` inside each source zip names the custodian and any additional
conditions, and the `.shp.xml` beside it is the ESRI metadata record.

## What is here

The source is a plain directory of about 1700 zips, nearly all holding one
layer three ways (FileGDB, shapefile, MapInfo TAB). Most products are split by
the 29 local government areas (LGAs); some are statewide; a few are both.
This mirror converts each layer once, from the FileGDB where there is one.

    manifest/      the catalogue: every source file (index.csv, files.csv),
                   every zip member (contents.csv), every layer with geometry
                   type, feature count, CRS and extent (layers.csv), a roll-up
                   per product (products.csv), and the conversion log keyed by
                   source etag (converted.csv)
    geoparquet/<product>/<region>/<layer>.parquet
                   one GeoParquet per vector layer; region is an LGA or statewide
    geoparquet/<product>/<layer>_union.vrt
                   an OGR VRT unioning the LGA files of a split product into one
                   statewide layer (with an lga field); open it directly or
                   read the per-LGA files as a partitioned dataset
    parquet/<product>/<region>/<table>.parquet
                   attribute-only tables, including the class tables of the
                   NCH raster products
    cog/<product>/<region>/<name>.tif
                   rasters as COG (ZSTD, 512 px blocks, overviews)

Sizes as of the first release: 13 GB GeoParquet, 7 GB COG (the source zips,
not mirrored, total 183 GB).

## Reading it

Everything is readable in place. The GeoParquet is GeoParquet 1.1 with a
covering bbox column and rows sorted by bbox, so spatial predicates prune row
groups.

DuckDB, one LGA-split product as a single table:

    INSTALL spatial; LOAD spatial;
    SELECT count(*) FROM read_parquet(
      's3://us-west-2.opendata.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/*/*.parquet',
      hive_partitioning = false);

GDAL / ogr:

    gdal vector info /vsis3/us-west-2.opendata.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/hobart/list_parcels_hobart.parquet
    gdal raster info /vsis3/us-west-2.opendata.source.coop/mdsumner/thelist-opendata/cog/nch_soil_drainage/statewide/nch_soil_drainage.tif

R:

    library(gdalraster)
    ds <- new(GDALVector, "/vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/hobart/list_parcels_hobart.parquet")

Python:

    import geopandas
    geopandas.read_parquet("https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/hobart/list_parcels_hobart.parquet")

Set `AWS_NO_SIGN_REQUEST=YES` for anonymous S3 access with GDAL.

## What conversion did and did not do

- Field names and types are the FileGDB's (Int16, DateTime and so on), not the
  shapefile's truncated names. Where a zip has no usable FileGDB the shapefile
  was used; `converted.csv` records which.
- Geometries are promoted to MULTI types. FileGDB curves (CurvePolygon,
  MultiSurface) are linearised, since GeoParquet has no curve types. M
  ordinates are dropped (one layer); Z is kept.
- The CRS is the source CRS, EPSG:28355 (GDA94 / MGA zone 55) nearly
  everywhere. Where the source carried an unidentified ESRI WKT naming MGA55,
  EPSG:28355 was assigned; nothing was reprojected.
- Coded-value field domains (code -> description lookups) are not carried into
  Parquet. The lookups are in the FileGDBs in the source zips.
- Raster FileGDBs (the NCH soil and enterprise-suitability grids) come through
  without their colour tables, but their attribute tables are in `parquet/`.
  Byte class grids have nearest-neighbour overviews.
- The LGA boundary that every per-LGA zip ships (`municipality_<lga>`) is
  converted once, under `geoparquet/municipality/`.
- Features that straddle LGA boundaries appear in both LGAs' files. In
  LIST_TRANSPORT_SEGMENTS they are clipped at the boundary, each piece keeping
  the same TRANSEG_ID. The `_union.vrt` is a union, not a dissolve;
  deduplicating is left to the reader (for LIST products `LIST_GUID` or `UFI`
  are the stable keys).
- Nothing was cleaned, clipped, simplified or edited.

## Known issues in the source, as found

- A dozen zips carry an empty FileGDB (system tables only) beside a full
  shapefile; the shapefile was used.
- LIST_LAND_USE_2013_BRS_GLAMORGAN_SPRING_BAY: the FileGDB has 0 features, the
  shapefile 9900.
- NCH_ES_WHEAT_STATEWIDE.zip contains a barley scenario FileGDB.
- About 40 of 2700 FileGDB/shapefile pairs differ by a few features.

Details and the exact files are in `manifest/layers.csv` and in the code
repository's README.

## Derived products

Things built from this mirror live in separate products, so this one stays a
straight conversion:

- https://source.coop/mdsumner/tas-transport-web - LIST_TRANSPORT_SEGMENTS as
  one statewide, browser-ready layer: EPSG:4326, clipped pieces rejoined to one
  row per TRANSEG_ID, integer endpoint nodes, Hilbert-sorted GeoParquet plus
  PMTiles, in dated snapshots.

## Provenance and updates

Every file traces to a source URL, its size, mtime and HTTP etag at the time of
conversion (`manifest/index.csv`, `manifest/converted.csv`). A re-run of the
pipeline against the live listing redoes only what changed upstream. First
release: crawled 2026-09-10, converted 2026-09-17.

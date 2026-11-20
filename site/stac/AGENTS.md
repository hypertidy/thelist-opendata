# Guidance for agents: Tasmania LIST open data catalogue

This is a STAC 1.1 catalogue (Portolan profile) of the statewide datasets in a
mirror of the LIST (Land Tasmania) open data bulk downloads. Every dataset is a
public file you can read in place; nothing needs downloading first.

## Finding data

- Start at `catalog.json`. Children: `vector/` (GeoParquet), `raster/` (COG),
  `tables/` (Parquet with no geometry). Each `<group>/<product>/collection.json`
  is one LIST product; its `assets` are the statewide files.
- Collection `id` is the product folder in the store; `keywords` include the
  LIST product code (e.g. `LIST_PARCELS`).
- Asset fields: `href` (HTTPS), `type`, `file:size`, `file:checksum`
  (sha2-256 multihash), `proj:code`, `proj:bbox`; for Parquet assets
  `table:row_count` and `table:columns` (names and types), so you can plan a
  query without opening the file.

## Reading

- GeoParquet is GeoParquet 1.1 with a `geometry_bbox` covering column, rows
  sorted by bbox, 65 536-row groups. Filter on `geometry_bbox` to read only the
  row groups you need; do not download whole layers to answer local questions.
  - DuckDB: `SELECT ... FROM read_parquet('<href>') WHERE geometry_bbox.xmax > ...`
    For `s3://us-west-2.opendata.source.coop/...` paths first
    `SET s3_region = 'us-west-2'; SET s3_url_style = 'path';`.
  - GDAL: prefix the href with `/vsicurl/` (or use `/vsis3/` with
    `AWS_NO_SIGN_REQUEST=YES`).
- COGs have internal overviews: read a window or a decimated overview with GDAL,
  rasterio or terra instead of the full grid.

## Coordinates

- Native CRS is kept: EPSG:28355 (GDA94 / MGA zone 55, metres) almost
  everywhere. Check `proj:code` per asset; a few are EPSG:3857, EPSG:32755,
  or MGA55 with AHD heights. Reproject yourself if you need lon/lat; the STAC
  extents are already in lon/lat.
- `list_tasveg_20` statewide has no CRS in its GeoParquet metadata; its
  coordinates are MGA zone 55 (EPSG:28355), not lon/lat.

## What the statewide files are

- Products LIST ships statewide: a straight conversion of LIST's zip.
- Products LIST ships only as 29 per-LGA zips: built from them. LIST clips a
  feature crossing an LGA boundary into each LGA; here the pieces are rejoined
  to one row per `LIST_GUID` (or the layer's own id), and `lga` lists the source
  LGAs (`;`-separated). Parts lying outside every LGA (over open water, e.g. the
  middle of Derwent and Tamar bridges) are not in the source, so not here.
  TASVEG 4.0 and its fire attributes have no feature id: stacked, still cut at
  LGA boundaries.
- Field names and types are the FileGDB's; coded-value domains are not carried.

## Obligations

- Attribution is required: `"<dataset name>" from theLIST (c) State of Tasmania`
  (licence CC BY 3.0 AU). Some datasets are published for other custodians; the
  source zip's readme names them (the collection's `via` links point to the zips).
- Data are refreshed monthly from the source, in place (no object versioning);
  the collection's temporal extent starts at the source release date.

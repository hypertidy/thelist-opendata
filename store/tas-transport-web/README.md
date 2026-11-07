# Tasmanian transport network, web-ready (LIST transport segments)

A single statewide copy of the LIST transport segments for Tasmania, prepared
for use directly in web browsers. It is derived from the mirror at
https://source.coop/mdsumner/thelist-opendata.

Data: (c) State of Tasmania, Creative Commons Attribution 3.0 Australia.
Code that built this: https://github.com/hypertidy/thelist-opendata (MIT,
`R/10_transport_web.R`).

## Attribution

    "LIST Transport Segments" from theLIST © State of Tasmania

Land Tasmania does not endorse this product or any use of it.

## What is here

    latest.json                                  {"snapshot": "<date>", "path": "<date>/"}
    <snapshot>/list_transport_segments.parquet   GeoParquet 1.1, EPSG:4326
    <snapshot>/list_transport_segments.pmtiles   vector tiles, zoom 6-15
    <snapshot>/snapshot.json                     source url, etag, mtime per LGA

`<snapshot>` is the date of the newest source zip (the LIST release the layer
reflects). Snapshot folders are never overwritten; a new LIST release gets a
new folder and `latest.json` moves. Groupings or other records keyed on
`TRANSEG_ID` should store the snapshot they were made against.

## Columns

    TRANSEG_ID   LIST segment id, one row each
    PRI_NAME     primary name
    SEC_NAME     secondary name
    COMP_LEN     LIST's computed length (m)
    TRANS_TYPE   transport type
    TRAN_CLASS   transport class
    lga          source LGA(s); ";"-separated when the segment crosses a boundary
    node0        integer id of the start node
    node1        integer id of the end node
    snapshot     as above
    geometry     MULTILINESTRING, EPSG:4326
    geometry_bbox  GeoParquet 1.1 bbox covering

## How it was made

- Read from the mirror's per-LGA GeoParquet (GDA94 / MGA zone 55).
- LIST clips a segment that crosses an LGA boundary into each LGA's file, each
  piece keeping the same TRANSEG_ID. The pieces are rejoined with a directed
  line merge (exactly shared cut vertex; no vertex moves, nothing reversed).
  For the 2025-07-10 snapshot: 1320 segments rejoined from 2646 pieces.
- `node0` / `node1` come from exact coordinate identity of segment endpoints in
  the source coordinates (wkpool `merge_coincident`, tolerance 0), so
  connectivity is integer equality. LIST_TRANSPORT_NODES carries no link to
  segments, so its TRANODE_ID is not used. Node ids are stable only within a
  snapshot. For multi-part segments, node0 is the start of the first part and
  node1 the end of the last.
- Reprojected with PROJ: inverse MGA55 to GDA94 geographic, labelled WGS 84
  (the EPSG:1150 null shift, about 1 m).
- Rows Hilbert-sorted (`gdal vector sort`), ZSTD, 65536-row groups.

## Known quirks (2025-07-10)

- 54 segments are still multi-part, 39 of them rejoined pieces that do not
  meet exactly.
- 839 of 284,831 segments differ from `COMP_LEN` by more than 1% in geometry
  length; not investigated.
- Whether LIST keeps TRANSEG_ID stable across releases is not yet known; it can
  be checked when the next release arrives.

## Reading it

DuckDB:

    INSTALL spatial; LOAD spatial;
    SELECT TRANSEG_ID, PRI_NAME, node0, node1
    FROM 'https://data.source.coop/mdsumner/tas-transport-web/2025-07-10/list_transport_segments.parquet'
    WHERE geometry_bbox.xmin > 147.30 AND geometry_bbox.xmax < 147.34
      AND geometry_bbox.ymin > -42.90 AND geometry_bbox.ymax < -42.87;

GDAL:

    ogrinfo -so /vsicurl/https://data.source.coop/mdsumner/tas-transport-web/2025-07-10/list_transport_segments.parquet

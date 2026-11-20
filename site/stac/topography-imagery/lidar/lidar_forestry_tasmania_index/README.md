# LIDAR Forestry Tasmania Index

LIDAR Forestry Tasmania Index: LIST product `LIDAR_FORESTRY_TASMANIA_INDEX`, statewide. 24 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIDAR Forestry Tasmania Index" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lidar_forestry_tasmania_index_statewide.parquet` | vector | 24 | 1.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_forestry_tasmania_index/statewide/lidar_forestry_tasmania_index_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_forestry_tasmania_index/statewide/lidar_forestry_tasmania_index_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flidar_forestry_tasmania_index%2Fstatewide%2Flidar_forestry_tasmania_index_statewide.parquet

## Columns

`DISCLAIMER` (string), `AREA_NAME` (string), `DATA_TIME` (string), `CAP_YEAR` (double), `CAP_MONTH` (double), `SENSOR` (string), `OWNER` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIDAR_FORESTRY_TASMANIA_INDEX_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIDAR_FORESTRY_TASMANIA_INDEX_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIDAR Forestry Tasmania Index" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

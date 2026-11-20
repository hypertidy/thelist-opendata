# LIDAR Index Mt Wellington

LIDAR Index Mt Wellington: LIST product `LIDAR_INDEX_MT_WELLINGTON`, statewide. 360 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIDAR Index Mt Wellington" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lidar_index_mt_wellington_statewide.parquet` | vector | 360 | 14.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_mt_wellington/statewide/lidar_index_mt_wellington_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_mt_wellington/statewide/lidar_index_mt_wellington_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flidar_index_mt_wellington%2Fstatewide%2Flidar_index_mt_wellington_statewide.parquet

## Columns

`TILENO` (double), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIDAR_INDEX_MT_WELLINGTON_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIDAR_INDEX_MT_WELLINGTON_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIDAR Index Mt Wellington" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIDAR Index DPAC Coastal

LIDAR Index DPAC Coastal: LIST product `LIDAR_INDEX_DPAC_COASTAL`, statewide. 557 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIDAR Index DPAC Coastal" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lidar_index_dpac_coastal_statewide.parquet` | vector | 557 | 27.7 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_dpac_coastal/statewide/lidar_index_dpac_coastal_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_dpac_coastal/statewide/lidar_index_dpac_coastal_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flidar_index_dpac_coastal%2Fstatewide%2Flidar_index_dpac_coastal_statewide.parquet

## Columns

`TILE_ID` (string), `XMIN` (double), `YMIN` (double), `XMAX` (double), `YMAX` (double), `TILE_NAME` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIDAR_INDEX_DPAC_COASTAL_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIDAR_INDEX_DPAC_COASTAL_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIDAR Index DPAC Coastal" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

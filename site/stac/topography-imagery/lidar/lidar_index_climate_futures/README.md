# LIDAR Index Climate Futures

LIDAR Index Climate Futures: LIST product `LIDAR_INDEX_CLIMATE_FUTURES`, statewide. 3,855 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIDAR Index Climate Futures" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lidar_index_climate_futures_statewide.parquet` | vector | 3,855 | 328.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_climate_futures/statewide/lidar_index_climate_futures_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_climate_futures/statewide/lidar_index_climate_futures_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flidar_index_climate_futures%2Fstatewide%2Flidar_index_climate_futures_statewide.parquet

## Columns

`TILENO` (string), `DIMAPID` (string), `PROJECTID` (string), `MINX` (double), `MINY` (double), `MAXX` (double), `MAXY` (double), `HASXYZ` (string), `HASASCIIGRD` (string), `HASLAS` (string), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIDAR_INDEX_CLIMATE_FUTURES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIDAR_INDEX_CLIMATE_FUTURES_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIDAR Index Climate Futures" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

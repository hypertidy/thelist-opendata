# LIDAR Index All Projects

LIDAR Index All Projects: LIST product `LIDAR_INDEX_ALL_PROJECTS`, statewide. 228 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIDAR Index All Projects" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lidar_index_all_projects_statewide.parquet` | vector | 228 | 1.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_all_projects/statewide/lidar_index_all_projects_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_all_projects/statewide/lidar_index_all_projects_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flidar_index_all_projects%2Fstatewide%2Flidar_index_all_projects_statewide.parquet

## Columns

`PERSIST_ID` (int32), `STATUS` (string), `PROJ_NAME` (string), `AREA_NAME` (string), `YEAR` (string), `START_DATE` (datetime), `COMPLETED` (datetime), `SENSOR` (string), `CLASS_LVL` (string), `PPM` (string), `VER_ACC` (string), `HOR_ACC` (string), `AREA_SQ_KM` (double), `METADATA` (string), `DOWNLOAD` (string), `COMMENTS` (string), `REPORT` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIDAR_INDEX_ALL_PROJECTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIDAR_INDEX_ALL_PROJECTS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIDAR Index All Projects" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

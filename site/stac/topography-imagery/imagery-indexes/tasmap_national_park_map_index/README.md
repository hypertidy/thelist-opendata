# Tasmap National Park Map Index

Tasmap National Park Map Index: LIST product `TASMAP_NATIONAL_PARK_MAP_INDEX`, statewide. 19 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasmap National Park Map Index" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasmap_national_park_map_index_statewide.parquet` | vector | 19 | 17.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmap_national_park_map_index/statewide/tasmap_national_park_map_index_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmap_national_park_map_index/statewide/tasmap_national_park_map_index_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasmap_national_park_map_index%2Fstatewide%2Ftasmap_national_park_map_index_statewide.parquet

## Columns

`MAP_NAME` (string), `MAP_NO` (string), `SCALE` (int32), `EDITION` (int16), `PROD_YEAR` (int16), `PRINT_NAME` (string), `REMARKS` (string), `PROD_CODE` (double), `HOR_DATUM` (string), `VER_DATUM` (string), `PROJECTION` (string), `MAP_URL` (string), `DIG_MAP_URL` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASMAP_NATIONAL_PARK_MAP_INDEX_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASMAP_NATIONAL_PARK_MAP_INDEX_STATEWIDE.zip), released 2025-07-17

## Attribution

"Tasmap National Park Map Index" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

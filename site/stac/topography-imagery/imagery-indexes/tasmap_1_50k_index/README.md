# Tasmap 1 50K Index

Tasmap 1 50K Index: LIST product `TASMAP_1_50K_INDEX`, statewide. 95 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasmap 1 50K Index" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasmap_1_50k_index_statewide.parquet` | vector | 95 | 22.1 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmap_1_50k_index/statewide/tasmap_1_50k_index_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmap_1_50k_index/statewide/tasmap_1_50k_index_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasmap_1_50k_index%2Fstatewide%2Ftasmap_1_50k_index_statewide.parquet

## Columns

`MAP_NAME` (string), `MAP_NO` (string), `EDITION` (int16), `PROD_YEAR` (int16), `BAR_NUM` (double), `HOR_DATUM` (string), `PUBLISH_METHOD` (string), `MAP_URL` (string), `DIG_MAP_URL` (string), `SCALE` (int32), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASMAP_1_50K_INDEX_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASMAP_1_50K_INDEX_STATEWIDE.zip), released 2025-07-10

## Attribution

"Tasmap 1 50K Index" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

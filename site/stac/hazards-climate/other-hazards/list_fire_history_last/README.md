# LIST Fire History Last

LIST Fire History Last: LIST product `LIST_FIRE_HISTORY_LAST`, statewide. 9,562 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-09-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Fire History Last" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_fire_history_last_statewide.parquet` | vector | 9,562 | 34.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_fire_history_last/statewide/list_fire_history_last_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_fire_history_last/statewide/list_fire_history_last_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_fire_history_last%2Fstatewide%2Flist_fire_history_last_statewide.parquet

## Columns

`INCD_NO` (string), `INCD_START` (datetime), `INCD_END` (datetime), `FIRE_NAME` (string), `FIRE_AR_HA` (double), `FIRE_TYPE` (string), `IGN_DATE` (datetime), `IGN_SEASON` (double), `IGN_CAUSE1` (string), `IGN_CAUSE2` (string), `SEVERITY` (string), `COMMENTS` (string), `FIRE_ID` (int32), `REVISION` (int16), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_FIRE_HISTORY_LAST_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FIRE_HISTORY_LAST_STATEWIDE.zip), released 2026-09-04

## Attribution

"LIST Fire History Last" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

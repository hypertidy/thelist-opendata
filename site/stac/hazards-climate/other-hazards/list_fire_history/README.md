# LIST Fire History

LIST Fire History: LIST product `LIST_FIRE_HISTORY`, statewide. 10,427 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-09-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Fire History" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_fire_history_statewide.parquet` | vector | 10,427 | 29.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_fire_history/statewide/list_fire_history_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_fire_history/statewide/list_fire_history_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_fire_history%2Fstatewide%2Flist_fire_history_statewide.parquet

## Columns

`INCD_NO` (string), `INCD_START` (datetime), `INCD_END` (datetime), `FIRE_NAME` (string), `FIRE_AR_HA` (double), `FIRE_TYPE` (string), `IGN_DATE` (datetime), `IGN_SEASON` (double), `IGN_CAUSE1` (string), `IGN_CAUSE2` (string), `SEVERITY` (string), `COMMENTS` (string), `FIRE_ID` (int32), `REVISION` (int16), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_FIRE_HISTORY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FIRE_HISTORY_STATEWIDE.zip), released 2026-09-04

## Attribution

"LIST Fire History" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

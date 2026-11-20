# LIST Irrigation Tasmania Irrigation Districts

LIST Irrigation Tasmania Irrigation Districts: LIST product `LIST_IRRIGATION_TASMANIA_IRRIGATION_DISTRICTS`, statewide. 21 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-06-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Irrigation Tasmania Irrigation Districts" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_irrigation_tasmania_irrigation_districts_statewide.parquet` | vector | 21 | 664.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_irrigation_tasmania_irrigation_districts/statewide/list_irrigation_tasmania_irrigation_districts_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_irrigation_tasmania_irrigation_districts/statewide/list_irrigation_tasmania_irrigation_districts_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_irrigation_tasmania_irrigation_districts%2Fstatewide%2Flist_irrigation_tasmania_irrigation_districts_statewide.parquet

## Columns

`CODE` (string), `SCHEME` (string), `TYPE` (string), `DISTRICT` (string), `STATUS` (string), `PLAN_REF` (string), `GLOBALID` (string), `SCHEMESTATUS` (string), `DATARESTR` (string), `TRANCHE` (string), `GAZ_DATE` (datetime), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_IRRIGATION_TASMANIA_IRRIGATION_DISTRICTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_IRRIGATION_TASMANIA_IRRIGATION_DISTRICTS_STATEWIDE.zip), released 2026-06-10

## Attribution

"LIST Irrigation Tasmania Irrigation Districts" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

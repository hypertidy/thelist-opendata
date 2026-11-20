# LIST CFEV River Sec Catch

LIST CFEV River Sec Catch: LIST product `LIST_CFEV_RIVER_SEC_CATCH`, statewide. 476,845 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV River Sec Catch" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_river_sec_catch_statewide.parquet` | vector | 476,845 | 292.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_river_sec_catch/statewide/list_cfev_river_sec_catch_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_river_sec_catch/statewide/list_cfev_river_sec_catch_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_river_sec_catch%2Fstatewide%2Flist_cfev_river_sec_catch_statewide.parquet

## Columns

`RSC_ID` (double), `RS_ID` (double), `SUBCAT_ID` (double), `CAT_ID` (double), `RSC_AREA` (double), `UFI` (string), `RSC_WBODY` (double), `RSC_MINELE` (double), `RSC_MAXELE` (double), `RSC_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_RIVER_SEC_CATCH_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVER_SEC_CATCH_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV River Sec Catch" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

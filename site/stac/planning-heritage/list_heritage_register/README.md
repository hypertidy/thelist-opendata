# LIST Heritage Register

LIST Heritage Register: LIST product `LIST_HERITAGE_REGISTER`, statewide. 6,720 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Heritage Register" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_heritage_register_statewide.parquet` | vector | 6,720 | 427.9 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_heritage_register/statewide/list_heritage_register_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_heritage_register/statewide/list_heritage_register_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_heritage_register%2Fstatewide%2Flist_heritage_register_statewide.parquet

## Columns

`THR_ID` (double), `NAME` (string), `CPR_NUMBER` (string), `EASTING` (double), `NORTHING` (double), `ADDRESS` (string), `PID` (string), `FOLIO` (double), `STATUS` (string), `TITLE` (string)

## Source

- [LIST_HERITAGE_REGISTER_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HERITAGE_REGISTER_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Heritage Register" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

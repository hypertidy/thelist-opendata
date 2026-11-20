# LIST Fmp Data

LIST Fmp Data: LIST product `LIST_FMP_DATA`, statewide. Attribute table, 187,304 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-08-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Fmp Data" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `fmp_data.parquet` | table | 187,304 | 2.1 MB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/list_fmp_data/statewide/fmp_data.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Flist_fmp_data%2Fstatewide%2Ffmp_data.parquet

## Columns

`OBJECTID` (int64), `FMP` (string), `FEAT_REL` (datetime), `ATT_REL` (datetime), `PLAN_ACC` (double), `ELEV_ACC` (double), `ATTR_ACC` (string), `SOURCE` (string), `ANZLIC_ID` (string)

## Source

- [LIST_FMP_DATA_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FMP_DATA_STATEWIDE.zip), released 2025-08-14

## Attribution

"LIST Fmp Data" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

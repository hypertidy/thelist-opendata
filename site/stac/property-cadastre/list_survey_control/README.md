# LIST Survey Control

LIST Survey Control: LIST product `LIST_SURVEY_CONTROL`, statewide. 12,465 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Survey Control" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_survey_control_statewide.parquet` | vector | 12,465 | 1.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_survey_control/statewide/list_survey_control_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_survey_control/statewide/list_survey_control_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_survey_control%2Fstatewide%2Flist_survey_control_statewide.parquet

## Columns

`PACK_ID` (string), `SITE_PK_ID` (string), `SCS_NAME` (string), `MGA_ZONE` (int16), `GDA2020_E` (double), `GDA2020_N` (double), `GDA2020_PU` (double), `PU_METHOD` (string), `HEIGHT` (double), `HGT_DATUM` (string), `HGT_CLASS` (string), `HGT_ORDER` (string), `GDA94_E` (double), `GDA94_N` (double), `HOR_CLASS` (string), `HOR_ORDER` (string), `TARGET_STR` (string), `MARKSTATUS` (string), `DESCRIPT` (string), `ORDER_SYMB` (string), `LIST_GUID` (string), `CRC_ID` (string)

## Source

- [LIST_SURVEY_CONTROL_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SURVEY_CONTROL_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIST Survey Control" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

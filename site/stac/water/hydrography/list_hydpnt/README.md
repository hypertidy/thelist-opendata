# LIST Hydpnt

LIST Hydpnt: LIST product `LIST_HYDPNT`, statewide. 48,799 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-01-12. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Hydpnt" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_hydpnt_statewide.parquet` | vector | 48,799 | 4.0 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_hydpnt/statewide/list_hydpnt_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_hydpnt/statewide/list_hydpnt_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_hydpnt%2Fstatewide%2Flist_hydpnt_statewide.parquet

## Columns

`HYDPNT_ID` (int32), `HYDPNTTY` (string), `NAME` (string), `NOM_REG_NO` (string), `DAM_TYPE` (string), `EXISTING` (string), `INUSE` (string), `ISLANDTYPE` (string), `HEIGHT` (double), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SEC_NOMREG` (string), `SEC_NAME` (string), `TER_NOMREG` (string), `TER_NAME` (string)

## Source

- [LIST_HYDPNT_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDPNT_STATEWIDE.zip), released 2021-01-12

## Attribution

"LIST Hydpnt" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

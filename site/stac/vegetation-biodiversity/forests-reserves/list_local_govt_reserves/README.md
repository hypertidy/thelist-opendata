# LIST Local Govt Reserves

LIST Local Govt Reserves: LIST product `LIST_LOCAL_GOVT_RESERVES`, statewide. 1,619 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Local Govt Reserves" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_local_govt_reserves_statewide.parquet` | vector | 1,619 | 485.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_local_govt_reserves/statewide/list_local_govt_reserves_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_local_govt_reserves/statewide/list_local_govt_reserves_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_local_govt_reserves%2Fstatewide%2Flist_local_govt_reserves_statewide.parquet

## Columns

`CID` (double), `CATEGORY` (string), `FEAT_NAME` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LOCAL_GOVT_RESERVES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCAL_GOVT_RESERVES_STATEWIDE.zip), released 2025-07-09

## Attribution

"LIST Local Govt Reserves" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

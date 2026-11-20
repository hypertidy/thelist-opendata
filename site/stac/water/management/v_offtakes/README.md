# V Offtakes

V Offtakes: LIST product `V_OFFTAKES`, statewide. 9,580 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "V Offtakes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `v_offtakes_statewide.parquet` | vector | 9,580 | 458.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/v_offtakes/statewide/v_offtakes_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/v_offtakes/statewide/v_offtakes_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fv_offtakes%2Fstatewide%2Fv_offtakes_statewide.parquet

## Columns

`OFFTAKE_ID` (double), `ORGANISATION` (string), `WE_NUMBER` (int32), `ALLOCATION_ID` (double), `EASTING` (int32), `NORTHING` (int32), `STREAM_NAME` (string), `PURPOSE` (string), `PERIOD_AMOUNT` (double), `START_DATE` (string), `END_DATE` (string), `SURETY` (int32), `ALLOCATION_STATUS` (string), `FINANCIAL_INTEREST` (string)

## Source

- [V_OFFTAKES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/V_OFFTAKES_STATEWIDE.zip), released 2025-07-18

## Attribution

"V Offtakes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

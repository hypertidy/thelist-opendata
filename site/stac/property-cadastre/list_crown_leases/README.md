# LIST Crown Leases

LIST Crown Leases: LIST product `LIST_CROWN_LEASES`, statewide. 1,261 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Crown Leases" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_crown_leases_statewide.parquet` | vector | 1,261 | 2.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_crown_leases/statewide/list_crown_leases_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_crown_leases/statewide/list_crown_leases_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_crown_leases%2Fstatewide%2Flist_crown_leases_statewide.parquet

## Columns

`CID` (double), `VOLUME` (string), `FOLIO` (int32), `PID` (double), `LEASE_TY` (string), `STATUS` (string), `AGR_ID` (string), `PLAN_REF` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CROWN_LEASES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CROWN_LEASES_STATEWIDE.zip), released 2025-07-09

## Attribution

"LIST Crown Leases" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

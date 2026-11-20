# LIST Marine Leases

LIST Marine Leases: LIST product `LIST_MARINE_LEASES`, statewide. 212 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Marine Leases" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_marine_leases_statewide.parquet` | vector | 212 | 60.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_leases/statewide/list_marine_leases_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_leases/statewide/list_marine_leases_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_marine_leases%2Fstatewide%2Flist_marine_leases_statewide.parquet

## Columns

`CID` (int32), `M_LEASE_NO` (string), `PLAN_REF` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_MARINE_LEASES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_MARINE_LEASES_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIST Marine Leases" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

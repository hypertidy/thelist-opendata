# LIST Marine Nature Reserves

LIST Marine Nature Reserves: LIST product `LIST_MARINE_NATURE_RESERVES`, statewide. 9 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Marine Nature Reserves" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_marine_nature_reserves_statewide.parquet` | vector | 9 | 868.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_nature_reserves/statewide/list_marine_nature_reserves_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_nature_reserves/statewide/list_marine_nature_reserves_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_marine_nature_reserves%2Fstatewide%2Flist_marine_nature_reserves_statewide.parquet

## Columns

`CID` (int32), `NAME` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `COMMENTS` (string), `PLAN_REF` (string), `PLAN_AUTH` (string), `INST_NO` (string), `GOVERN_ACT` (string), `GAZ_DATE` (string), `EFFEC_DATE` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `NOM_REG_NO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_MARINE_NATURE_RESERVES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_MARINE_NATURE_RESERVES_STATEWIDE.zip), released 2025-07-09

## Attribution

"LIST Marine Nature Reserves" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

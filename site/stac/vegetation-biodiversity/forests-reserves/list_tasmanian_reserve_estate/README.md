# LIST Tasmanian Reserve Estate

LIST Tasmanian Reserve Estate: LIST product `LIST_TASMANIAN_RESERVE_ESTATE`, statewide. 25,548 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-01-29. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasmanian Reserve Estate" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasmanian_reserve_estate_statewide.parquet` | vector | 25,548 | 99.7 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasmanian_reserve_estate/statewide/list_tasmanian_reserve_estate_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasmanian_reserve_estate/statewide/list_tasmanian_reserve_estate_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasmanian_reserve_estate%2Fstatewide%2Flist_tasmanian_reserve_estate_statewide.parquet

## Columns

`FOREIGN_ID` (double), `RES_CLASS` (string), `RES_STATUS` (string), `RES_NAME` (string), `NAME_SHORT` (string), `MANAGE` (string), `MINING` (string), `ACT` (string), `CREATED` (int32), `EXPIRY` (int32), `IUCN` (string), `FOR_ID2` (int32), `CREATED2` (int32), `PROJECT` (string), `AS_AT_DATE` (int32), `ENVIRON` (string), `FISHING` (string), `TERM` (string), `REG` (string), `NRS` (string), `MGT_PLAN` (string), `DATA_SRC` (string), `AUTHORITY` (string), `AREA_HA` (double), `Shape_Length` (double), `Shape_Area` (double)

## Source

- [LIST_TASMANIAN_RESERVE_ESTATE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASMANIAN_RESERVE_ESTATE_STATEWIDE.zip), released 2026-01-29

## Attribution

"LIST Tasmanian Reserve Estate" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

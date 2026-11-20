# LIST Authority Land

LIST Authority Land: LIST product `LIST_AUTHORITY_LAND`, statewide. 37,411 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Authority Land" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_authority_land_statewide.parquet` | vector | 37,411 | 64.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_authority_land/statewide/list_authority_land_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_authority_land/statewide/list_authority_land_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_authority_land%2Fstatewide%2Flist_authority_land_statewide.parquet

## Columns

`CID` (double), `VOLUME` (string), `FOLIO` (int32), `PID` (double), `POT_PID` (double), `AUTH_TYPE` (string), `FOREIGN_ID` (string), `TENURE_TY` (string), `FEAT_NAME` (string), `NOM_REG_NO` (string), `MAP_TEXT` (string), `PLAN_REF` (string), `PLAN_AUTH` (string), `INST_TYPE` (string), `INST_NO` (string), `GOVERN_ACT` (string), `GAZ_DATE` (string), `EFFEC_DATE` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_AUTHORITY_LAND_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_BREAK_O_DAY.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_BRIGHTON.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_BURNIE.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_CENTRAL_COAST.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_CENTRAL_HIGHLANDS.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_CIRCULAR_HEAD.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_CLARENCE.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_DERWENT_VALLEY.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_DEVONPORT.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_DORSET.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_FLINDERS.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_GEORGE_TOWN.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_GLAMORGAN_SPRING_BAY.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_GLENORCHY.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_HOBART.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_HUON_VALLEY.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_KENTISH.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_KING_ISLAND.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_KINGBOROUGH.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_LATROBE.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_LAUNCESTON.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_MEANDER_VALLEY.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_NORTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_SORELL.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_SOUTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_TASMAN.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_WARATAH_WYNYARD.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_WEST_COAST.zip), released 2025-07-10
- [LIST_AUTHORITY_LAND_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AUTHORITY_LAND_WEST_TAMAR.zip), released 2025-07-10

## Attribution

"LIST Authority Land" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

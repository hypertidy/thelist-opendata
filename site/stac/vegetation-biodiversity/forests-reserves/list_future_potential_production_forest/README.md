# LIST Future Potential Production Forest

LIST Future Potential Production Forest: LIST product `LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST`, statewide. 231 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Future Potential Production Forest" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_future_potential_production_forest_statewide.parquet` | vector | 231 | 1.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_future_potential_production_forest/statewide/list_future_potential_production_forest_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_future_potential_production_forest/statewide/list_future_potential_production_forest_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_future_potential_production_forest%2Fstatewide%2Flist_future_potential_production_forest_statewide.parquet

## Columns

`CID` (int32), `CATEGORY` (string), `LOT_NUM` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `PLAN_REF` (string), `PLAN_AUTH` (string), `INST_TYPE` (string), `INST_NO` (string), `GOVERN_ACT` (string), `GAZ_DATE` (string), `EFFEC_DATE` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_BRIGHTON.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_BURNIE.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_CLARENCE.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_DEVONPORT.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_DORSET.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_FLINDERS.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_GLENORCHY.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_HOBART.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_HUON_VALLEY.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_KENTISH.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_KING_ISLAND.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_KINGBOROUGH.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_LATROBE.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_LAUNCESTON.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_SORELL.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_TASMAN.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_WEST_COAST.zip), released 2025-07-17
- [LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FUTURE_POTENTIAL_PRODUCTION_FOREST_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST Future Potential Production Forest" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

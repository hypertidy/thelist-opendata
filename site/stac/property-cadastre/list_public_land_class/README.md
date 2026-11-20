# LIST Public Land Class

LIST Public Land Class: LIST product `LIST_PUBLIC_LAND_CLASS`, statewide. 5,990 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Public Land Class" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_public_land_class_statewide.parquet` | vector | 5,990 | 33.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_public_land_class/statewide/list_public_land_class_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_public_land_class/statewide/list_public_land_class_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_public_land_class%2Fstatewide%2Flist_public_land_class_statewide.parquet

## Columns

`CID` (int32), `CATEGORY` (string), `NAME` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `PLAN_REF` (string), `PLAN_AUTH` (string), `INST_TYPE` (string), `INST_NO` (string), `GOVERN_ACT` (string), `GAZ_DATE` (string), `EFFEC_DATE` (string), `PRIOR_TYPE` (string), `PRIOR_MTOD` (string), `PRIOR_INST` (string), `PRIOR_GAZ` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `NOM_REG_NO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_PUBLIC_LAND_CLASS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_BRIGHTON.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_BURNIE.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_CLARENCE.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_DEVONPORT.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_DORSET.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_FLINDERS.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_GLENORCHY.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_HOBART.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_KENTISH.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_KING_ISLAND.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_LATROBE.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_LAUNCESTON.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_SORELL.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_TASMAN.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_WEST_COAST.zip), released 2025-07-17
- [LIST_PUBLIC_LAND_CLASS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST Public Land Class" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

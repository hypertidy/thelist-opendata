# LIST Easements

LIST Easements: LIST product `LIST_EASEMENTS`, statewide. 22,311 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Easements" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_easements_statewide.parquet` | vector | 22,311 | 3.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_easements/statewide/list_easements_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_easements/statewide/list_easements_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_easements%2Fstatewide%2Flist_easements_statewide.parquet

## Columns

`CID` (int32), `VOLUME` (string), `FOLIO` (int16), `EASEMNT_TY` (string), `PLAN_REF` (string), `PLAN_AUTH` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_EASEMENTS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_EASEMENTS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_BRIGHTON.zip), released 2025-07-17
- [LIST_EASEMENTS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_BURNIE.zip), released 2025-07-17
- [LIST_EASEMENTS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_EASEMENTS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_EASEMENTS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_EASEMENTS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_CLARENCE.zip), released 2025-07-17
- [LIST_EASEMENTS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_EASEMENTS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_DEVONPORT.zip), released 2025-07-17
- [LIST_EASEMENTS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_DORSET.zip), released 2025-07-17
- [LIST_EASEMENTS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_FLINDERS.zip), released 2025-07-17
- [LIST_EASEMENTS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_EASEMENTS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_EASEMENTS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_GLENORCHY.zip), released 2025-07-17
- [LIST_EASEMENTS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_HOBART.zip), released 2025-07-17
- [LIST_EASEMENTS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_EASEMENTS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_KENTISH.zip), released 2025-07-17
- [LIST_EASEMENTS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_KING_ISLAND.zip), released 2025-07-17
- [LIST_EASEMENTS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_EASEMENTS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_LATROBE.zip), released 2025-07-17
- [LIST_EASEMENTS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_LAUNCESTON.zip), released 2025-07-17
- [LIST_EASEMENTS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_EASEMENTS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_EASEMENTS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_SORELL.zip), released 2025-07-17
- [LIST_EASEMENTS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_EASEMENTS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_TASMAN.zip), released 2025-07-17
- [LIST_EASEMENTS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_EASEMENTS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_WEST_COAST.zip), released 2025-07-17
- [LIST_EASEMENTS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EASEMENTS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST Easements" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

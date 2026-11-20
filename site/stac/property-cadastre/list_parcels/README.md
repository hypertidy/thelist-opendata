# LIST Parcels

LIST Parcels: LIST product `LIST_PARCELS`, statewide. 433,845 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Parcels" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_parcels_statewide.parquet` | vector | 433,845 | 137.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/statewide/list_parcels_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parcels/statewide/list_parcels_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_parcels%2Fstatewide%2Flist_parcels_statewide.parquet

## Columns

`CID` (int32), `VOLUME` (string), `FOLIO` (int16), `PID` (int32), `POT_PID` (int32), `LPI` (string), `CAD_TYPE1` (string), `CAD_TYPE2` (string), `TENURE_TY` (string), `FEAT_NAME` (string), `STRATA_LEV` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_PARCELS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_BREAK_O_DAY.zip), released 2025-07-09
- [LIST_PARCELS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_BRIGHTON.zip), released 2025-07-09
- [LIST_PARCELS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_BURNIE.zip), released 2025-07-09
- [LIST_PARCELS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_CENTRAL_COAST.zip), released 2025-07-09
- [LIST_PARCELS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_CENTRAL_HIGHLANDS.zip), released 2025-07-09
- [LIST_PARCELS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_CIRCULAR_HEAD.zip), released 2025-07-09
- [LIST_PARCELS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_CLARENCE.zip), released 2025-07-09
- [LIST_PARCELS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_DERWENT_VALLEY.zip), released 2025-07-09
- [LIST_PARCELS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_DEVONPORT.zip), released 2025-07-09
- [LIST_PARCELS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_DORSET.zip), released 2025-07-09
- [LIST_PARCELS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_FLINDERS.zip), released 2025-07-09
- [LIST_PARCELS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_GEORGE_TOWN.zip), released 2025-07-09
- [LIST_PARCELS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-09
- [LIST_PARCELS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_GLENORCHY.zip), released 2025-07-09
- [LIST_PARCELS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_HOBART.zip), released 2025-07-09
- [LIST_PARCELS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_HUON_VALLEY.zip), released 2025-07-09
- [LIST_PARCELS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_KENTISH.zip), released 2025-07-09
- [LIST_PARCELS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_KING_ISLAND.zip), released 2025-07-09
- [LIST_PARCELS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_KINGBOROUGH.zip), released 2025-07-09
- [LIST_PARCELS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_LATROBE.zip), released 2025-07-09
- [LIST_PARCELS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_LAUNCESTON.zip), released 2025-07-09
- [LIST_PARCELS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_MEANDER_VALLEY.zip), released 2025-07-09
- [LIST_PARCELS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_NORTHERN_MIDLANDS.zip), released 2025-07-09
- [LIST_PARCELS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_SORELL.zip), released 2025-07-09
- [LIST_PARCELS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_TASMAN.zip), released 2025-07-09
- [LIST_PARCELS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_WARATAH_WYNYARD.zip), released 2025-07-09
- [LIST_PARCELS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_WEST_COAST.zip), released 2025-07-09
- [LIST_PARCELS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_WEST_TAMAR.zip), released 2025-07-09
- [LIST_PARCELS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARCELS_SOUTHERN_MIDLANDS.zip), released 2025-07-09

## Attribution

"LIST Parcels" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

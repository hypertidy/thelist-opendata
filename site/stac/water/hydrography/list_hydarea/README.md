# LIST Hydarea

LIST Hydarea: LIST product `LIST_HYDAREA`, statewide. 248,641 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Hydarea" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_hydarea_statewide.parquet` | vector | 248,641 | 209.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_hydarea/statewide/list_hydarea_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_hydarea/statewide/list_hydarea_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_hydarea%2Fstatewide%2Flist_hydarea_statewide.parquet

## Columns

`HYDAREA_ID` (double), `HYDARTY1` (string), `HYDARTY2` (string), `NAME` (string), `NOM_REG_NO` (string), `SEC_NAME` (string), `SEC_NOMREG` (string), `TER_NAME` (string), `TER_NOMREG` (string), `HYD_CLASS` (string), `PERENNIAL` (string), `EXISTING` (string), `WC_BED_TY` (string), `RELGRND` (string), `INUSE` (string), `ISLANDTYPE` (string), `ELEVATION` (double), `COMP_AREA` (double), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_HYDAREA_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_BREAK_O_DAY.zip), released 2025-07-09
- [LIST_HYDAREA_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_BRIGHTON.zip), released 2025-07-09
- [LIST_HYDAREA_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_BURNIE.zip), released 2025-07-09
- [LIST_HYDAREA_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_CENTRAL_COAST.zip), released 2025-07-09
- [LIST_HYDAREA_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_CENTRAL_HIGHLANDS.zip), released 2025-07-09
- [LIST_HYDAREA_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_CIRCULAR_HEAD.zip), released 2025-07-09
- [LIST_HYDAREA_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_CLARENCE.zip), released 2025-07-09
- [LIST_HYDAREA_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_DERWENT_VALLEY.zip), released 2025-07-09
- [LIST_HYDAREA_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_DEVONPORT.zip), released 2025-07-09
- [LIST_HYDAREA_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_DORSET.zip), released 2025-07-09
- [LIST_HYDAREA_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_FLINDERS.zip), released 2025-07-09
- [LIST_HYDAREA_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_GEORGE_TOWN.zip), released 2025-07-09
- [LIST_HYDAREA_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_GLAMORGAN_SPRING_BAY.zip), released 2025-07-09
- [LIST_HYDAREA_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_GLENORCHY.zip), released 2025-07-09
- [LIST_HYDAREA_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_HOBART.zip), released 2025-07-09
- [LIST_HYDAREA_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_HUON_VALLEY.zip), released 2025-07-09
- [LIST_HYDAREA_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_KENTISH.zip), released 2025-07-09
- [LIST_HYDAREA_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_KING_ISLAND.zip), released 2025-07-09
- [LIST_HYDAREA_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_KINGBOROUGH.zip), released 2025-07-09
- [LIST_HYDAREA_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_LATROBE.zip), released 2025-07-09
- [LIST_HYDAREA_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_LAUNCESTON.zip), released 2025-07-09
- [LIST_HYDAREA_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_MEANDER_VALLEY.zip), released 2025-07-09
- [LIST_HYDAREA_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_NORTHERN_MIDLANDS.zip), released 2025-07-09
- [LIST_HYDAREA_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_SORELL.zip), released 2025-07-09
- [LIST_HYDAREA_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_SOUTHERN_MIDLANDS.zip), released 2025-07-09
- [LIST_HYDAREA_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_TASMAN.zip), released 2025-07-09
- [LIST_HYDAREA_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_WARATAH_WYNYARD.zip), released 2025-07-09
- [LIST_HYDAREA_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_WEST_COAST.zip), released 2025-07-09
- [LIST_HYDAREA_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDAREA_WEST_TAMAR.zip), released 2025-07-09

## Attribution

"LIST Hydarea" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

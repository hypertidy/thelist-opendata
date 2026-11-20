# LIST Hydline

LIST Hydline: LIST product `LIST_HYDLINE`, statewide. 1,276,498 features, multi-linestring (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Hydline" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_hydline_statewide.parquet` | vector | 1,276,498 | 380.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_hydline/statewide/list_hydline_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_hydline/statewide/list_hydline_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_hydline%2Fstatewide%2Flist_hydline_statewide.parquet

## Columns

`HYDLINE_ID` (double), `HYDLNTY1` (string), `HYDLNTY2` (string), `NAME` (string), `NOM_REG_NO` (string), `MHWM_TYPE` (string), `HYD_CLASS` (string), `EXISTING` (string), `RELGRND` (string), `INUSE` (string), `HYDCNTR_TY` (string), `ADJ_FEAT_1` (string), `ADJ_FEAT_2` (string), `HEIGHT` (double), `COMP_LEN` (double), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `lga` (string)

## Source

- [LIST_HYDLINE_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_BREAK_O_DAY.zip), released 2025-07-10
- [LIST_HYDLINE_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_BRIGHTON.zip), released 2025-07-10
- [LIST_HYDLINE_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_BURNIE.zip), released 2025-07-10
- [LIST_HYDLINE_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_CENTRAL_COAST.zip), released 2025-07-10
- [LIST_HYDLINE_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_CENTRAL_HIGHLANDS.zip), released 2025-07-10
- [LIST_HYDLINE_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_CIRCULAR_HEAD.zip), released 2025-07-10
- [LIST_HYDLINE_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_CLARENCE.zip), released 2025-07-10
- [LIST_HYDLINE_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_DERWENT_VALLEY.zip), released 2025-07-10
- [LIST_HYDLINE_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_DEVONPORT.zip), released 2025-07-10
- [LIST_HYDLINE_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_DORSET.zip), released 2025-07-10
- [LIST_HYDLINE_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_FLINDERS.zip), released 2025-07-10
- [LIST_HYDLINE_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_GEORGE_TOWN.zip), released 2025-07-10
- [LIST_HYDLINE_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_GLAMORGAN_SPRING_BAY.zip), released 2025-07-10
- [LIST_HYDLINE_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_GLENORCHY.zip), released 2025-07-10
- [LIST_HYDLINE_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_HOBART.zip), released 2025-07-10
- [LIST_HYDLINE_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_HUON_VALLEY.zip), released 2025-07-10
- [LIST_HYDLINE_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_KENTISH.zip), released 2025-07-10
- [LIST_HYDLINE_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_KING_ISLAND.zip), released 2025-07-10
- [LIST_HYDLINE_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_KINGBOROUGH.zip), released 2025-07-10
- [LIST_HYDLINE_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_LATROBE.zip), released 2025-07-10
- [LIST_HYDLINE_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_LAUNCESTON.zip), released 2025-07-10
- [LIST_HYDLINE_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_MEANDER_VALLEY.zip), released 2025-07-10
- [LIST_HYDLINE_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_NORTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_HYDLINE_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_SORELL.zip), released 2025-07-10
- [LIST_HYDLINE_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_SOUTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_HYDLINE_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_TASMAN.zip), released 2025-07-10
- [LIST_HYDLINE_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_WARATAH_WYNYARD.zip), released 2025-07-10
- [LIST_HYDLINE_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_WEST_COAST.zip), released 2025-07-10
- [LIST_HYDLINE_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_HYDLINE_WEST_TAMAR.zip), released 2025-07-10

## Attribution

"LIST Hydline" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

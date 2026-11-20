# LIST CFEV Rivers

LIST CFEV Rivers: LIST product `LIST_CFEV_RIVERS`, statewide. 360,972 features, multi-linestring (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `RS_ID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Rivers" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_rivers_statewide.parquet` | vector | 360,972 | 108.0 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_rivers/statewide/list_cfev_rivers_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_rivers/statewide/list_cfev_rivers_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_rivers%2Fstatewide%2Flist_cfev_rivers_statewide.parquet

## Columns

`RS_ID` (double), `RS_LENGTH` (double), `RSC_ID` (double), `UFI` (string), `SUBCAT_ID` (double), `CAT_ID` (double), `RSC_AREA` (double), `RSC_ACAREA` (double), `RS_MAP` (string), `RS_PIPE` (double), `RS_SLOPE` (double), `RS_ELEVMAX` (double), `RS_ELEVMIN` (double), `RS_ORDER` (double), `RS_NSCORE` (double), `RS_ICV` (string), `RS_LTENSEC` (string), `RS_CMPI1` (string), `RS_CMPP1` (string), `RS_CMPI2` (string), `RS_CMPP2` (string), `RS_WBODY` (double), `RS_RCV` (string), `RS_NSCOR_C` (string), `RS_NAME` (string), `RS_SVDIV` (double), `RS_INFO` (string), `SHAPE_Length` (double), `lga` (string)

## Source

- [LIST_CFEV_RIVERS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_BRIGHTON.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_BURNIE.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_CLARENCE.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_DEVONPORT.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_DORSET.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_FLINDERS.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_GLENORCHY.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_HOBART.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_KENTISH.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_KING_ISLAND.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_LATROBE.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_LAUNCESTON.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_SORELL.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_TASMAN.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_WEST_COAST.zip), released 2025-07-17
- [LIST_CFEV_RIVERS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_RIVERS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST CFEV Rivers" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

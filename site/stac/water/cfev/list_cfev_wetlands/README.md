# LIST CFEV Wetlands

LIST CFEV Wetlands: LIST product `LIST_CFEV_WETLANDS`, statewide. 20,597 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `WL_ID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Wetlands" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_wetlands_statewide.parquet` | vector | 20,597 | 19.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_wetlands/statewide/list_cfev_wetlands_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_wetlands/statewide/list_cfev_wetlands_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_wetlands%2Fstatewide%2Flist_cfev_wetlands_statewide.parquet

## Columns

`WL_ID` (double), `WL_AREA` (double), `WL_ELEV` (double), `WL_MAP` (string), `WL_NSCORE` (double), `WL_ICV` (string), `WL_RCV` (string), `WL_LTENSEC` (string), `WL_LTS_M` (double), `WL_LTS_H` (double), `WL_CMPI1` (string), `WL_CMPP1` (string), `WL_CMPI2` (string), `WL_CMPP2` (string), `CAT_ID` (double), `WL_NSCOR_C` (string), `SUBCAT_ID` (double), `WL_NAME` (string), `WL_SVDIV` (double), `WL_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_CFEV_WETLANDS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_BRIGHTON.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_BURNIE.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_CLARENCE.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_DEVONPORT.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_DORSET.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_FLINDERS.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_GLENORCHY.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_HOBART.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_KENTISH.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_KING_ISLAND.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_LATROBE.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_LAUNCESTON.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_SORELL.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_TASMAN.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_WEST_COAST.zip), released 2025-07-17
- [LIST_CFEV_WETLANDS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WETLANDS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST CFEV Wetlands" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Community Facilities

LIST Community Facilities: LIST product `LIST_COMMUNITY_FACILITIES`, statewide. 4,120 features, multi-point (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Community Facilities" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_community_facilities_statewide.parquet` | vector | 4,120 | 416.4 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_community_facilities/statewide/list_community_facilities_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_community_facilities/statewide/list_community_facilities_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_community_facilities%2Fstatewide%2Flist_community_facilities_statewide.parquet

## Columns

`COMFAC_ID` (int32), `PID` (int32), `COM_TYPE1` (string), `COM_TYPE2` (string), `NAME` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `NOM_REG_NO` (string), `lga` (string)

## Source

- [LIST_COMMUNITY_FACILITIES_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_BREAK_O_DAY.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_BRIGHTON.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_BURNIE.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_CENTRAL_COAST.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_CENTRAL_HIGHLANDS.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_CIRCULAR_HEAD.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_CLARENCE.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_DERWENT_VALLEY.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_DEVONPORT.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_DORSET.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_FLINDERS.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_GEORGE_TOWN.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_GLAMORGAN_SPRING_BAY.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_GLENORCHY.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_HOBART.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_HUON_VALLEY.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_KENTISH.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_KING_ISLAND.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_KINGBOROUGH.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_LATROBE.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_LAUNCESTON.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_MEANDER_VALLEY.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_NORTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_SORELL.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_SOUTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_TASMAN.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_WARATAH_WYNYARD.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_WEST_COAST.zip), released 2025-07-10
- [LIST_COMMUNITY_FACILITIES_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COMMUNITY_FACILITIES_WEST_TAMAR.zip), released 2025-07-10

## Attribution

"LIST Community Facilities" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

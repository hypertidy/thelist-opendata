# LIST Transport Segments

LIST Transport Segments: LIST product `LIST_TRANSPORT_SEGMENTS`, statewide. 284,831 features, multi-linestring (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Transport Segments" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_transport_segments_statewide.parquet` | vector | 284,831 | 55.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_transport_segments/statewide/list_transport_segments_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_transport_segments/statewide/list_transport_segments_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_transport_segments%2Fstatewide%2Flist_transport_segments_statewide.parquet

## Columns

`TRANSEG_ID` (int32), `TRANS_TYPE` (string), `TSEG_FEAT` (string), `STATUS` (string), `TRAFF_DIR` (string), `TRAN_CLASS` (string), `USER_TYPE` (string), `TOUR_CLASS` (string), `SURFACE_TY` (string), `PRI_NAME` (string), `PRI_NOMREG` (string), `SEC_NAME` (string), `SEC_NOMREG` (string), `BRIDGE_TUNNEL_NAME` (string), `BRIDGE_TUNNEL_NOMREG` (string), `AUTHORITY` (string), `FOREIGN_ID` (string), `COMP_LEN` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `TC_NOMREG` (string), `QTR_NOMREG` (string), `QTR_NAME` (string), `SHAPE_Length` (double), `lga` (string)

## Source

- [LIST_TRANSPORT_SEGMENTS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_BREAK_O_DAY.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_BRIGHTON.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_BURNIE.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_CENTRAL_COAST.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_CENTRAL_HIGHLANDS.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_CIRCULAR_HEAD.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_CLARENCE.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_DERWENT_VALLEY.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_DEVONPORT.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_DORSET.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_FLINDERS.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_GEORGE_TOWN.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_GLENORCHY.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_HOBART.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_HUON_VALLEY.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_KENTISH.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_KING_ISLAND.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_KINGBOROUGH.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_LATROBE.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_LAUNCESTON.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_MEANDER_VALLEY.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_NORTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_SORELL.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_SOUTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_TASMAN.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_WARATAH_WYNYARD.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_WEST_COAST.zip), released 2025-07-10
- [LIST_TRANSPORT_SEGMENTS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_SEGMENTS_WEST_TAMAR.zip), released 2025-07-10

## Attribution

"LIST Transport Segments" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

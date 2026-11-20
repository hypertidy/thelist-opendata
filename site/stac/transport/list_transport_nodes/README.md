# LIST Transport Nodes

LIST Transport Nodes: LIST product `LIST_TRANSPORT_NODES`, statewide. 252,658 features, multi-point (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Transport Nodes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_transport_nodes_statewide.parquet` | vector | 252,658 | 16.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_transport_nodes/statewide/list_transport_nodes_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_transport_nodes/statewide/list_transport_nodes_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_transport_nodes%2Fstatewide%2Flist_transport_nodes_statewide.parquet

## Columns

`TRANODE_ID` (int32), `TNODE_FEAT` (string), `BARRIER_TY` (string), `BRIDGE_TY` (string), `BRIDGE_NAM` (string), `TUNNEL_TY` (string), `TUNNEL_NAM` (string), `CARRIER_NA` (string), `STATUS` (string), `TRAFF_DIR` (string), `JUNC_MOVE` (string), `AUTHORITY` (string), `FOREIGN_ID` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `PRI_NOMREG` (string), `PRI_NAME` (string), `SEC_NOMREG` (string), `SEC_NAME` (string), `lga` (string)

## Source

- [LIST_TRANSPORT_NODES_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_BREAK_O_DAY.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_BRIGHTON.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_BURNIE.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_CENTRAL_COAST.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_CENTRAL_HIGHLANDS.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_CIRCULAR_HEAD.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_CLARENCE.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_DERWENT_VALLEY.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_DEVONPORT.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_DORSET.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_FLINDERS.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_GEORGE_TOWN.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_GLAMORGAN_SPRING_BAY.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_GLENORCHY.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_HOBART.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_HUON_VALLEY.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_KENTISH.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_KING_ISLAND.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_KINGBOROUGH.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_LATROBE.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_LAUNCESTON.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_MEANDER_VALLEY.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_NORTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_SORELL.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_SOUTHERN_MIDLANDS.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_TASMAN.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_WARATAH_WYNYARD.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_WEST_COAST.zip), released 2025-07-10
- [LIST_TRANSPORT_NODES_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TRANSPORT_NODES_WEST_TAMAR.zip), released 2025-07-10

## Attribution

"LIST Transport Nodes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

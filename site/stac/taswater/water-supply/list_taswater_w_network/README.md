# LIST TASWATER W Network

LIST TASWATER W Network: LIST product `LIST_TASWATER_W_NETWORK`, statewide. 887 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER W Network" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_w_network_statewide.parquet` | vector | 887 | 81.7 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_w_network/statewide/list_taswater_w_network_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_w_network/statewide/list_taswater_w_network_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_w_network%2Fstatewide%2Flist_taswater_w_network_statewide.parquet

## Columns

`CRC_ID` (string), `NAME` (string), `SUBTYPECD` (double), `D_SUBTYPEC` (string), `LOCATIONID` (string), `LIST_GUID` (string)

## Source

- [LIST_TASWATER_W_NETWORK_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_W_NETWORK_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST TASWATER W Network" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

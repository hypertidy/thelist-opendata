# LIST TASWATER SW Network

LIST TASWATER SW Network: LIST product `LIST_TASWATER_SW_NETWORK`, statewide. 6 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER SW Network" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_sw_network_statewide.parquet` | vector | 6 | 10.4 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_sw_network/statewide/list_taswater_sw_network_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_sw_network/statewide/list_taswater_sw_network_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_sw_network%2Fstatewide%2Flist_taswater_sw_network_statewide.parquet

## Columns

`CRC_ID` (string), `LOCATIONID` (string), `NAME` (string), `SUBTYPECD` (double), `D_SUBTYPEC` (string), `LIST_GUID` (string)

## Source

- [LIST_TASWATER_SW_NETWORK_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_SW_NETWORK_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST TASWATER SW Network" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

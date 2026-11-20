# LIST Tasnetworks Tower Line Network

LIST Tasnetworks Tower Line Network: LIST product `LIST_TASNETWORKS_TOWER_LINE_NETWORK`, statewide. 242 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasnetworks Tower Line Network" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasnetworks_tower_line_network_statewide.parquet` | vector | 242 | 224.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_tower_line_network/statewide/list_tasnetworks_tower_line_network_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_tower_line_network/statewide/list_tasnetworks_tower_line_network_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasnetworks_tower_line_network%2Fstatewide%2Flist_tasnetworks_tower_line_network_statewide.parquet

## Columns

`LINE_NAME` (string), `SHAPE_Length` (double)

## Source

- [LIST_TASNETWORKS_TOWER_LINE_NETWORK_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASNETWORKS_TOWER_LINE_NETWORK_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Tasnetworks Tower Line Network" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

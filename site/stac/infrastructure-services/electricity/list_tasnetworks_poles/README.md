# LIST Tasnetworks Poles

LIST Tasnetworks Poles: LIST product `LIST_TASNETWORKS_POLES`, statewide. 305,870 features, multi-point z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasnetworks Poles" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasnetworks_poles_statewide.parquet` | vector | 305,870 | 11.0 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_poles/statewide/list_tasnetworks_poles_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_poles/statewide/list_tasnetworks_poles_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasnetworks_poles%2Fstatewide%2Flist_tasnetworks_poles_statewide.parquet

## Columns

`TAG_NUMBER` (int32)

## Source

- [LIST_TASNETWORKS_POLES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASNETWORKS_POLES_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Tasnetworks Poles" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

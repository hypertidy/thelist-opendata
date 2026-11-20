# LIST TASWATER Rw Main

LIST TASWATER Rw Main: LIST product `LIST_TASWATER_RW_MAIN`, statewide. 990 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER Rw Main" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_rw_main_statewide.parquet` | vector | 990 | 128.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_rw_main/statewide/list_taswater_rw_main_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_rw_main/statewide/list_taswater_rw_main_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_rw_main%2Fstatewide%2Flist_taswater_rw_main_statewide.parquet

## Columns

`CRC_ID` (string), `SUBTYPECD` (double), `DIAMETER` (double), `LIST_GUID` (string), `SHAPE_Length` (double)

## Source

- [LIST_TASWATER_RW_MAIN_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_RW_MAIN_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST TASWATER Rw Main" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

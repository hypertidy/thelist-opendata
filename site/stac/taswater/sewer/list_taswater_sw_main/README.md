# LIST TASWATER SW Main

LIST TASWATER SW Main: LIST product `LIST_TASWATER_SW_MAIN`, statewide. 3,709 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER SW Main" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_sw_main_statewide.parquet` | vector | 3,709 | 321.2 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_sw_main/statewide/list_taswater_sw_main_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_sw_main/statewide/list_taswater_sw_main_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_sw_main%2Fstatewide%2Flist_taswater_sw_main_statewide.parquet

## Columns

`CRC_ID` (string), `ASSETID` (string), `SUBTYPECD` (double), `MATERIAL` (string), `DIAMETER` (double), `D_SUBTYPEC` (string), `D_MATERIAL` (string), `D_DIAMETER` (string), `LIST_GUID` (string), `SHAPE_Length` (double)

## Source

- [LIST_TASWATER_SW_MAIN_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_SW_MAIN_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST TASWATER SW Main" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

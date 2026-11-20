# LIST TASWATER Drinking Catch

LIST TASWATER Drinking Catch: LIST product `LIST_TASWATER_DRINKING_CATCH`, statewide. 104 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER Drinking Catch" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_drinking_catch_statewide.parquet` | vector | 104 | 624.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_drinking_catch/statewide/list_taswater_drinking_catch_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_drinking_catch/statewide/list_taswater_drinking_catch_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_drinking_catch%2Fstatewide%2Flist_taswater_drinking_catch_statewide.parquet

## Columns

`CRC_ID` (string), `COMMENTS` (string), `NAME` (string), `INTAKE` (string), `PERIMETER` (double), `CATCH_AREA` (double), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASWATER_DRINKING_CATCH_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_DRINKING_CATCH_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST TASWATER Drinking Catch" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST CFEV Subcatchments

LIST CFEV Subcatchments: LIST product `LIST_CFEV_SUBCATCHMENTS`, statewide. 1,159 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Subcatchments" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_subcatchments_statewide.parquet` | vector | 1,159 | 21.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_subcatchments/statewide/list_cfev_subcatchments_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_subcatchments/statewide/list_cfev_subcatchments_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_subcatchments%2Fstatewide%2Flist_cfev_subcatchments_statewide.parquet

## Columns

`SUBCAT_ID` (double), `SC_NAME` (string), `SC_AREA` (double), `CAT_ID` (double), `CAT_NAME` (string), `SC_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_SUBCATCHMENTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_SUBCATCHMENTS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Subcatchments" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

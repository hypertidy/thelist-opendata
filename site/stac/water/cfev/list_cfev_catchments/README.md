# LIST CFEV Catchments

LIST CFEV Catchments: LIST product `LIST_CFEV_CATCHMENTS`, statewide. 48 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Catchments" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_catchments_statewide.parquet` | vector | 48 | 7.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_catchments/statewide/list_cfev_catchments_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_catchments/statewide/list_cfev_catchments_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_catchments%2Fstatewide%2Flist_cfev_catchments_statewide.parquet

## Columns

`CAT_ID` (double), `CAT_NAME` (string), `CAT_AREA` (double), `CAT_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_CATCHMENTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_CATCHMENTS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Catchments" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

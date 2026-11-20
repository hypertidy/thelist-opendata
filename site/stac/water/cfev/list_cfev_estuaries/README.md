# LIST CFEV Estuaries

LIST CFEV Estuaries: LIST product `LIST_CFEV_ESTUARIES`, statewide. 113 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Estuaries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_estuaries_statewide.parquet` | vector | 113 | 1.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_estuaries/statewide/list_cfev_estuaries_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_estuaries/statewide/list_cfev_estuaries_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_estuaries%2Fstatewide%2Flist_cfev_estuaries_statewide.parquet

## Columns

`ES_ID` (double), `ES_AREA` (double), `RSC_ID` (double), `SUBCAT_ID` (double), `CAT_ID` (double), `ES_MAP` (string), `ES_NSCORE` (double), `ES_ICV` (string), `ES_RCV` (string), `ES_LTENSEC` (string), `ES_CMPI1` (string), `ES_CMPP1` (string), `ES_CMPI2` (string), `ES_CMPP2` (string), `ES_NAME` (string), `ES_NSCOR_C` (string), `ES_SVDIV` (double), `ES_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_ESTUARIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_ESTUARIES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Estuaries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

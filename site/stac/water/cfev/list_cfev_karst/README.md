# LIST CFEV Karst

LIST CFEV Karst: LIST product `LIST_CFEV_KARST`, statewide. 334 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Karst" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_karst_statewide.parquet` | vector | 334 | 910.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_karst/statewide/list_cfev_karst_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_karst/statewide/list_cfev_karst_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_karst%2Fstatewide%2Flist_cfev_karst_statewide.parquet

## Columns

`KT_ID` (double), `KT_NAME` (string), `KT_AREA` (double), `KT_MAP` (string), `KT_NSCORE` (double), `KT_ICV` (string), `KT_RCV` (string), `KT_LTENSEC` (string), `KT_CMPI1` (string), `KT_CMPP1` (string), `KT_CMPI2` (string), `KT_CMPP2` (string), `KT_NSCOR_C` (string), `KT_SVDIV` (double), `KT_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_KARST_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_KARST_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Karst" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

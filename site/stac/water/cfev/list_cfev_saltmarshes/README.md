# LIST CFEV Saltmarshes

LIST CFEV Saltmarshes: LIST product `LIST_CFEV_SALTMARSHES`, statewide. 336 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Saltmarshes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_saltmarshes_statewide.parquet` | vector | 336 | 530.1 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_saltmarshes/statewide/list_cfev_saltmarshes_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_saltmarshes/statewide/list_cfev_saltmarshes_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_saltmarshes%2Fstatewide%2Flist_cfev_saltmarshes_statewide.parquet

## Columns

`SM_ID` (double), `SM_AREA` (double), `SM_MAP` (string), `SM_DIVPOLY` (double), `SM_LOCAT` (string), `SM_NSCORE` (double), `SM_ICV` (string), `SM_RCV` (string), `SM_LTENSEC` (string), `SM_CMPI1` (string), `SM_CMPP1` (string), `SM_CMPI2` (string), `SM_CMPP2` (string), `SUBCAT_ID` (double), `CAT_ID` (double), `SM_NSCOR_C` (string), `SM_SVDIV` (double), `SM_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_SALTMARSHES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_SALTMARSHES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Saltmarshes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

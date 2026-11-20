# LIST CFEV Waterbodies

LIST CFEV Waterbodies: LIST product `LIST_CFEV_WATERBODIES`, statewide. 1,346 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Waterbodies" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_waterbodies_statewide.parquet` | vector | 1,346 | 5.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_waterbodies/statewide/list_cfev_waterbodies_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_waterbodies/statewide/list_cfev_waterbodies_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_waterbodies%2Fstatewide%2Flist_cfev_waterbodies_statewide.parquet

## Columns

`WB_ID` (double), `WB_NAME` (string), `WB_AREA` (double), `WB_ELEV` (double), `RSC_ID` (double), `UFI` (string), `SUBCAT_ID` (double), `CAT_ID` (double), `WB_MAP` (string), `WB_DEPTH` (string), `WB_NSCORE` (double), `WB_ICV` (string), `WB_LTENSEC` (string), `WB_CMPI1` (string), `WB_CMPP1` (string), `WB_CMPI2` (string), `WB_CMPP2` (string), `WB_RCV` (string), `WB_NSCOR_C` (string), `WB_SVDIV` (double), `WB_INFO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CFEV_WATERBODIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_WATERBODIES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Waterbodies" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

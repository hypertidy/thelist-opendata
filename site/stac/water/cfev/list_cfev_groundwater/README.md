# LIST CFEV Groundwater

LIST CFEV Groundwater: LIST product `LIST_CFEV_GROUNDWATER`, statewide. 115 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST CFEV Groundwater" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_cfev_groundwater_statewide.parquet` | vector | 115 | 16.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_groundwater/statewide/list_cfev_groundwater_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_cfev_groundwater/statewide/list_cfev_groundwater_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_cfev_groundwater%2Fstatewide%2Flist_cfev_groundwater_statewide.parquet

## Columns

`GDE_ID` (double), `GDE_NAME` (string), `SUBCAT_ID` (double), `CAT_ID` (double), `GDE_MAP` (string), `GDE_TYPE` (string), `GDE_LOCAT` (string), `GDE_SOURCE` (string), `GDE_INFO` (string)

## Source

- [LIST_CFEV_GROUNDWATER_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CFEV_GROUNDWATER_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST CFEV Groundwater" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

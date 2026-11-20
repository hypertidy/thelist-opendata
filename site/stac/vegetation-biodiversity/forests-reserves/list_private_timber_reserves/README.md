# LIST Private Timber Reserves

LIST Private Timber Reserves: LIST product `LIST_PRIVATE_TIMBER_RESERVES`, statewide. 4,828 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Private Timber Reserves" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_private_timber_reserves_statewide.parquet` | vector | 4,828 | 2.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_private_timber_reserves/statewide/list_private_timber_reserves_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_private_timber_reserves/statewide/list_private_timber_reserves_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_private_timber_reserves%2Fstatewide%2Flist_private_timber_reserves_statewide.parquet

## Columns

`PTR_ID` (double), `PTR_CODE` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_PRIVATE_TIMBER_RESERVES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PRIVATE_TIMBER_RESERVES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Private Timber Reserves" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

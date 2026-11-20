# LIST Lobster Blocks

LIST Lobster Blocks: LIST product `LIST_LOBSTER_BLOCKS`, statewide. 156 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Lobster Blocks" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_lobster_blocks_statewide.parquet` | vector | 156 | 5.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_lobster_blocks/statewide/list_lobster_blocks_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_lobster_blocks/statewide/list_lobster_blocks_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_lobster_blocks%2Fstatewide%2Flist_lobster_blocks_statewide.parquet

## Columns

`BLOCK` (string), `LATITUDE` (double), `LONGITUDE` (double), `LAND` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LOBSTER_BLOCKS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOBSTER_BLOCKS_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Lobster Blocks" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

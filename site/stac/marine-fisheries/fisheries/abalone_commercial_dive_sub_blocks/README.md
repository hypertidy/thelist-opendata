# Abalone Commercial Dive Sub Blocks

Abalone Commercial Dive Sub Blocks: LIST product `ABALONE_COMMERCIAL_DIVE_SUB_BLOCKS`, statewide. 154 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Abalone Commercial Dive Sub Blocks" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `abalone_commercial_dive_sub_blocks_statewide.parquet` | vector | 154 | 7.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/abalone_commercial_dive_sub_blocks/statewide/abalone_commercial_dive_sub_blocks_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/abalone_commercial_dive_sub_blocks/statewide/abalone_commercial_dive_sub_blocks_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fabalone_commercial_dive_sub_blocks%2Fstatewide%2Fabalone_commercial_dive_sub_blocks_statewide.parquet

## Columns

`SUBBLOCKNO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [ABALONE_COMMERCIAL_DIVE_SUB_BLOCKS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/ABALONE_COMMERCIAL_DIVE_SUB_BLOCKS_STATEWIDE.zip), released 2025-07-18

## Attribution

"Abalone Commercial Dive Sub Blocks" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

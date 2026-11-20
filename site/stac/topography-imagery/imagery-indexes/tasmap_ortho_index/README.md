# Tasmap Ortho Index

Tasmap Ortho Index: LIST product `TASMAP_ORTHO_INDEX`, statewide. 687 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasmap Ortho Index" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasmap_ortho_index_statewide.parquet` | vector | 687 | 56.9 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmap_ortho_index/statewide/tasmap_ortho_index_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmap_ortho_index/statewide/tasmap_ortho_index_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasmap_ortho_index%2Fstatewide%2Ftasmap_ortho_index_statewide.parquet

## Columns

`MAP_NAME` (string), `MAP_NO` (string), `SCALE` (double), `EDITION` (double), `PROD_YEAR` (double), `PRINT_NAME` (string), `REMARKS` (string), `PROD_CODE` (double), `HOR_DATUM` (string), `VER_DATUM` (string), `PROJECTION` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASMAP_ORTHO_INDEX_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASMAP_ORTHO_INDEX_STATEWIDE.zip), released 2025-07-10

## Attribution

"Tasmap Ortho Index" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Tasgas Declared Pipeline Corridor

Tasgas Declared Pipeline Corridor: LIST product `TASGAS_DECLARED_PIPELINE_CORRIDOR`, statewide. 12 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasgas Declared Pipeline Corridor" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasgas_declared_pipeline_corridor_statewide.parquet` | vector | 12 | 287.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasgas_declared_pipeline_corridor/statewide/tasgas_declared_pipeline_corridor_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasgas_declared_pipeline_corridor/statewide/tasgas_declared_pipeline_corridor_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasgas_declared_pipeline_corridor%2Fstatewide%2Ftasgas_declared_pipeline_corridor_statewide.parquet

## Columns

`NETWORK` (string), `MATERIAL` (string), `DESCRIPTION` (string), `CORRIDOR_W` (string), `CORRIDOR_WIDTH_EACHSIDE` (string), `FEATURE_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASGAS_DECLARED_PIPELINE_CORRIDOR_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASGAS_DECLARED_PIPELINE_CORRIDOR_STATEWIDE.zip), released 2025-07-18

## Attribution

"Tasgas Declared Pipeline Corridor" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Gas Pipeline Planning Corridor

Gas Pipeline Planning Corridor: LIST product `GAS_PIPELINE_PLANNING_CORRIDOR`, statewide. 1 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Gas Pipeline Planning Corridor" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `gas_pipeline_planning_corridor_statewide.parquet` | vector | 1 | 363.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/gas_pipeline_planning_corridor/statewide/gas_pipeline_planning_corridor_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/gas_pipeline_planning_corridor/statewide/gas_pipeline_planning_corridor_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fgas_pipeline_planning_corridor%2Fstatewide%2Fgas_pipeline_planning_corridor_statewide.parquet

## Columns

`GEODB_OID` (int32), `EXTERNAL_STAGING_GAS_PIPELINE_PLAN_CORRIDOR_LIST_AREA` (double), `PERIMETER` (double), `VERSION` (string), `DATE_` (string), `SHAPE_LENG` (double), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [GAS_PIPELINE_PLANNING_CORRIDOR_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/GAS_PIPELINE_PLANNING_CORRIDOR_STATEWIDE.zip), released 2025-07-17

## Attribution

"Gas Pipeline Planning Corridor" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

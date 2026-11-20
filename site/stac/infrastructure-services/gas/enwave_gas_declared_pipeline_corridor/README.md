# Enwave Gas Declared Pipeline Corridor

Enwave Gas Declared Pipeline Corridor: LIST product `ENWAVE_GAS_DECLARED_PIPELINE_CORRIDOR`, statewide. 12 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Enwave Gas Declared Pipeline Corridor" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `enwave_gas_declared_pipeline_corridor_statewide.parquet` | vector | 12 | 287.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/enwave_gas_declared_pipeline_corridor/statewide/enwave_gas_declared_pipeline_corridor_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/enwave_gas_declared_pipeline_corridor/statewide/enwave_gas_declared_pipeline_corridor_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fenwave_gas_declared_pipeline_corridor%2Fstatewide%2Fenwave_gas_declared_pipeline_corridor_statewide.parquet

## Columns

`NETWORK` (string), `MATERIAL` (string), `DESCRIPTIO` (string), `CORRIDOR_W` (string), `CORRIDOR_1` (string), `FEATURE_ID` (string), `SHAPE_AREA` (decimal), `SHAPE_LEN` (decimal)

## Source

- [ENWAVE_GAS_DECLARED_PIPELINE_CORRIDOR_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/ENWAVE_GAS_DECLARED_PIPELINE_CORRIDOR_STATEWIDE.zip), released 2025-07-17

## Attribution

"Enwave Gas Declared Pipeline Corridor" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Tasmanian Gas Pipeline Easement

Tasmanian Gas Pipeline Easement: LIST product `TASMANIAN_GAS_PIPELINE_EASEMENT`, statewide. 185 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasmanian Gas Pipeline Easement" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasmanian_gas_pipeline_easement_statewide.parquet` | vector | 185 | 68.2 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmanian_gas_pipeline_easement/statewide/tasmanian_gas_pipeline_easement_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmanian_gas_pipeline_easement/statewide/tasmanian_gas_pipeline_easement_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasmanian_gas_pipeline_easement%2Fstatewide%2Ftasmanian_gas_pipeline_easement_statewide.parquet

## Columns

`GEODB_OID` (int32), `LAYER` (string), `VERSION` (string), `DATE_` (string), `SHAPE_LENG` (double), `SHAPE_Length` (double)

## Source

- [TASMANIAN_GAS_PIPELINE_EASEMENT_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASMANIAN_GAS_PIPELINE_EASEMENT_STATEWIDE.zip), released 2025-07-17

## Attribution

"Tasmanian Gas Pipeline Easement" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

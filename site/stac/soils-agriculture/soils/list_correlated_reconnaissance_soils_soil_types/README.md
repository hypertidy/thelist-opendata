# LIST Correlated Reconnaissance Soils Soil Types

LIST Correlated Reconnaissance Soils Soil Types: LIST product `LIST_CORRELATED_RECONNAISSANCE_SOILS_SOIL_TYPES`, statewide. 2,478 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Correlated Reconnaissance Soils Soil Types" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_correlated_reconnaissance_soils_soil_types_statewide.parquet` | vector | 2,478 | 3.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_correlated_reconnaissance_soils_soil_types/statewide/list_correlated_reconnaissance_soils_soil_types_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_correlated_reconnaissance_soils_soil_types/statewide/list_correlated_reconnaissance_soils_soil_types_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_correlated_reconnaissance_soils_soil_types%2Fstatewide%2Flist_correlated_reconnaissance_soils_soil_types_statewide.parquet

## Columns

`CODE` (string), `MAP_UNIT_N` (string), `MAP_UNIT_C` (string), `AUSTRALIAN` (string), `SOIL_PROF` (string), `REPORT` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_CORRELATED_RECONNAISSANCE_SOILS_SOIL_TYPES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_CORRELATED_RECONNAISSANCE_SOILS_SOIL_TYPES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Correlated Reconnaissance Soils Soil Types" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

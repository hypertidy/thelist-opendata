# Potential Ag Land Initial Analysis

Potential Ag Land Initial Analysis: LIST product `POTENTIAL_AG_LAND_INITIAL_ANALYSIS`, statewide. 827 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Potential Ag Land Initial Analysis" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `potential_ag_land_initial_analysis_statewide.parquet` | vector | 827 | 37.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/potential_ag_land_initial_analysis/statewide/potential_ag_land_initial_analysis_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/potential_ag_land_initial_analysis/statewide/potential_ag_land_initial_analysis_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fpotential_ag_land_initial_analysis%2Fstatewide%2Fpotential_ag_land_initial_analysis_statewide.parquet

## Columns

`DESCRIPTION` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [POTENTIAL_AG_LAND_INITIAL_ANALYSIS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/POTENTIAL_AG_LAND_INITIAL_ANALYSIS_STATEWIDE.zip), released 2025-07-18

## Attribution

"Potential Ag Land Initial Analysis" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

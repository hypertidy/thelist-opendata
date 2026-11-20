# Water Management Plan Areas

Water Management Plan Areas: LIST product `WATER_MANAGEMENT_PLAN_AREAS`, statewide. 39 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Water Management Plan Areas" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lyr_statewide.parquet` | vector | 39 | 1.2 MB |
| `water_management_plan_areas_statewide.parquet` | vector | 39 | 1.3 MB |
| `water_management_plan_areas.parquet` | vector | 39 | 1.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/water_management_plan_areas/statewide/lyr_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/water_management_plan_areas/statewide/lyr_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fwater_management_plan_areas%2Fstatewide%2Flyr_statewide.parquet

## Columns

`AREA_ID` (double), `PLAN_NAME` (string), `SHORT_NAME` (string), `AREA_TYPE` (string), `ZONE_NAME` (string), `STATUS` (string), `DRAFT_DATE` (string), `ADOPTED` (string), `EFFECTIVE` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [WATER_MANAGEMENT_PLAN_AREAS.LYR_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WATER_MANAGEMENT_PLAN_AREAS.LYR_STATEWIDE.zip), released 2017-09-06

## Attribution

"Water Management Plan Areas" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

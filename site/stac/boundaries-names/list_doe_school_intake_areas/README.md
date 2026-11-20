# LIST Doe School Intake Areas

LIST Doe School Intake Areas: LIST product `LIST_DOE_SCHOOL_INTAKE_AREAS`, statewide. 149 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Doe School Intake Areas" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_doe_school_intake_areas_statewide.parquet` | vector | 149 | 14.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_doe_school_intake_areas/statewide/list_doe_school_intake_areas_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_doe_school_intake_areas/statewide/list_doe_school_intake_areas_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_doe_school_intake_areas%2Fstatewide%2Flist_doe_school_intake_areas_statewide.parquet

## Columns

`SCHOOL_NAME` (string), `SCHOOL_SECTOR_NAME` (string), `LEARNING_SERVICE` (string), `SCHOOL_NUMBER` (string), `ASSOCIATE_FEEDER` (string), `LABEL` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_DOE_SCHOOL_INTAKE_AREAS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DOE_SCHOOL_INTAKE_AREAS_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Doe School Intake Areas" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Local Govt Areas

LIST Local Govt Areas: LIST product `LIST_LOCAL_GOVT_AREAS`, statewide. 29 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Local Govt Areas" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_local_govt_areas_statewide.parquet` | vector | 29 | 15.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_local_govt_areas/statewide/list_local_govt_areas_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_local_govt_areas/statewide/list_local_govt_areas_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_local_govt_areas%2Fstatewide%2Flist_local_govt_areas_statewide.parquet

## Columns

`LGA_ID` (int32), `NAME` (string), `LGA_CODE` (int16), `PLAN_REF` (string), `GAZ_DATE` (datetime), `NOM_REG_NO` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LOCAL_GOVT_AREAS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCAL_GOVT_AREAS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Local Govt Areas" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

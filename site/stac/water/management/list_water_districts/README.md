# LIST Water Districts

LIST Water Districts: LIST product `LIST_WATER_DISTRICTS`, statewide. 60 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Water Districts" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_water_districts_statewide.parquet` | vector | 60 | 1.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_water_districts/statewide/list_water_districts_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_water_districts/statewide/list_water_districts_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_water_districts%2Fstatewide%2Flist_water_districts_statewide.parquet

## Columns

`PERSIST_ID` (int32), `NAME` (string), `CATEGORY` (string), `PLAN_REF` (string), `GAZ_DATE` (string), `OTHER_PROC` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `FOREIGN_ID` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_WATER_DISTRICTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_WATER_DISTRICTS_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIST Water Districts" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

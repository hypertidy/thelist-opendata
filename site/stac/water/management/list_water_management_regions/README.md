# LIST Water Management Regions

LIST Water Management Regions: LIST product `LIST_WATER_MANAGEMENT_REGIONS`, statewide. 206 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-11-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Water Management Regions" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_water_management_regions_statewide.parquet` | vector | 206 | 5.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_water_management_regions/statewide/list_water_management_regions_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_water_management_regions/statewide/list_water_management_regions_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_water_management_regions%2Fstatewide%2Flist_water_management_regions_statewide.parquet

## Columns

`PROC_PLAN` (string), `REGION_NO` (int16), `INDEX_PLAN` (string), `CATCH_NO` (int32), `CATCH_NAME` (string), `ID` (double), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_WATER_MANAGEMENT_REGIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_WATER_MANAGEMENT_REGIONS_STATEWIDE.zip), released 2020-11-10

## Attribution

"LIST Water Management Regions" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

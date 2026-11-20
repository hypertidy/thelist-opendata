# LIST Land Use 2021

LIST Land Use 2021: LIST product `LIST_LAND_USE_2021`, statewide. 138,337 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-06-07. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Use 2021" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_use_2021_statewide.parquet` | vector | 138,337 | 310.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2021/statewide/list_land_use_2021_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2021/statewide/list_land_use_2021_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_use_2021%2Fstatewide%2Flist_land_use_2021_statewide.parquet

## Columns

`LU_PRIMARY_CODE` (int16), `LU_PRIMARY_DESCRIPTION` (string), `LU_CODEN` (int32), `LU_CODE_DESCRIPTION` (string), `COMMOD_DESC` (string), `COMMOD_DESC2` (string), `MANAGE_DESC` (string), `MANAGE_DESC2` (string), `COMMENTS` (string), `SOURCE_SCALE` (string), `SOURCE_DATE` (datetime), `SOURCE_DATA` (string), `CONFIDENCE` (int16), `CONFIDENCE_DESCRIPTION` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_USE_2021_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_USE_2021_STATEWIDE.zip), released 2023-06-07

## Attribution

"LIST Land Use 2021" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

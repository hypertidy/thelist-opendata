# LIST Land Use 2019 BRS

LIST Land Use 2019 BRS: LIST product `LIST_LAND_USE_2019_BRS`, statewide. 156,064 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-01-12. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Use 2019 BRS" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_use_2019_brs_statewide.parquet` | vector | 156,064 | 310.7 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2019_brs/statewide/list_land_use_2019_brs_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2019_brs/statewide/list_land_use_2019_brs_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_use_2019_brs%2Fstatewide%2Flist_land_use_2019_brs_statewide.parquet

## Columns

`LU_PRIMARY_CODE` (int16), `LU_CODEN` (int32), `COMMOD_DESC` (string), `COMMENTS` (string), `SOURCE_SCALE` (string), `SOURCE_DATE` (datetime), `SOURCE_DATA` (string), `CONFIDENCE` (int16), `COMMOD_DESC2` (string), `MANAGE_DESC` (string), `MANAGE_DESC2` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_USE_2019_BRS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_USE_2019_BRS_STATEWIDE.zip), released 2021-01-12

## Attribution

"LIST Land Use 2019 BRS" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

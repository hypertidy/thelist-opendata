# LIST Land Use 2015 BRS

LIST Land Use 2015 BRS: LIST product `LIST_LAND_USE_2015_BRS`, statewide. 168,952 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-10-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Use 2015 BRS" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_use_2015_brs_statewide.parquet` | vector | 168,952 | 345.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2015_brs/statewide/list_land_use_2015_brs_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2015_brs/statewide/list_land_use_2015_brs_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_use_2015_brs%2Fstatewide%2Flist_land_use_2015_brs_statewide.parquet

## Columns

`LU_CODE` (string), `LUC_DATE` (datetime), `LU_DESCRIPTION` (string), `COMMOD_CODE` (string), `COMMOD_DESC` (string), `COMMENTS` (string), `SOURCE_SCALE` (string), `LU_CODEN` (int32), `SOURCE_DATE` (datetime), `SOURCE_DATA` (string), `CONFIDENCE` (string), `COMMOD_CODE2` (string), `COMMOD_DESC2` (string), `MANAGE_CODE` (string), `MANAGE_DESC` (string), `MANAGE_CODE2` (string), `MANAGE_DESC2` (string), `LU_ID` (int32), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_USE_2015_BRS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_USE_2015_BRS_STATEWIDE.zip), released 2019-10-16

## Attribution

"LIST Land Use 2015 BRS" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

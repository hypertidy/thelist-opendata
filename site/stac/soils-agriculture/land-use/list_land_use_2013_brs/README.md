# LIST Land Use 2013 BRS

LIST Land Use 2013 BRS: LIST product `LIST_LAND_USE_2013_BRS`, statewide. 245,486 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-01-19. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Use 2013 BRS" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_use_2013_brs_statewide.parquet` | vector | 245,486 | 349.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2013_brs/statewide/list_land_use_2013_brs_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2013_brs/statewide/list_land_use_2013_brs_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_use_2013_brs%2Fstatewide%2Flist_land_use_2013_brs_statewide.parquet

## Columns

`LU_CODE` (string), `LUC_DATE` (datetime), `LU_DESCRIPTION` (string), `COMMOD_CODE` (string), `COMMOD_DESC` (string), `COMMENTS` (string), `SOURCE_SCALE` (string), `LU_CODEN` (int32), `SOURCE_DATE` (datetime), `SOURCE_DATA` (string), `CONFIDENCE` (int16), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_USE_2013_BRS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_USE_2013_BRS_STATEWIDE.zip), released 2018-01-19

## Attribution

"LIST Land Use 2013 BRS" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

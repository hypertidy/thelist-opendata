# LIST Land Use 2002 BRS

LIST Land Use 2002 BRS: LIST product `LIST_LAND_USE_2002_BRS`, statewide. 23,992 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-01-15. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Use 2002 BRS" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_use_2002_brs_statewide.parquet` | vector | 23,992 | 36.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2002_brs/statewide/list_land_use_2002_brs_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_use_2002_brs/statewide/list_land_use_2002_brs_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_use_2002_brs%2Fstatewide%2Flist_land_use_2002_brs_statewide.parquet

## Columns

`LUAGD_` (double), `LUAGD_ID` (double), `TAG` (string), `CODE` (string), `SOURCE_SCA` (double), `SOURCE_DAT` (string), `RELIABILIT` (string), `CODING_DAT` (string), `MAPNAME` (string), `NOTES` (string), `NUTR_SCORE` (double), `FIRST_CODE` (int16), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_USE_2002_BRS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_USE_2002_BRS_STATEWIDE.zip), released 2021-01-15

## Attribution

"LIST Land Use 2002 BRS" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

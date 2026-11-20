# LIST Aerial Photo Centres

LIST Aerial Photo Centres: LIST product `LIST_AERIAL_PHOTO_CENTRES`, statewide. 213,980 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Aerial Photo Centres" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_aerial_photo_centres_statewide.parquet` | vector | 213,980 | 20.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_aerial_photo_centres/statewide/list_aerial_photo_centres_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_aerial_photo_centres/statewide/list_aerial_photo_centres_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_aerial_photo_centres%2Fstatewide%2Flist_aerial_photo_centres_statewide.parquet

## Columns

`PHOTO_ID` (int32), `FILM_NO` (string), `FRAME` (string), `RUN_NO` (string), `FLY_DATE` (datetime), `FLY_SEASON` (string), `ALTITUDE` (int32), `TRACK` (double), `IP_OWNER` (int16), `IP_OWNER_T` (string), `NEG_CHECK` (int16), `NEG_CHCK_T` (string), `EASTING` (int32), `NORTHING` (int32), `AP_SOURCE` (int16), `AP_SRC_T` (string), `SOURCE_RES` (double), `AP_PATH` (string), `AP_THUMB_PATH` (string), `LIST_GUID` (string), `COMMENTS` (string), `PROJECT_ID` (int32), `PROJECT_NO` (string), `PROJ_NAME` (string), `CLIENT` (string), `CAMERA` (string), `CAMERA_NO` (string), `LENS_FL` (double), `LENS_NO` (string), `FORMAT` (string), `IMAGE_TYPE` (int16), `FLOWN_BY` (string), `PROJ_GUID` (string), `FLY_YEAR` (string), `IMG_TYP_T` (string), `SCALE` (string), `IMAGE_NAME` (string)

## Source

- [LIST_AERIAL_PHOTO_CENTRES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_AERIAL_PHOTO_CENTRES_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIST Aerial Photo Centres" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

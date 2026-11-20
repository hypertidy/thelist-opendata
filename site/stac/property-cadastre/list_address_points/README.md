# LIST Address Points

LIST Address Points: LIST product `LIST_ADDRESS_POINTS`, statewide. 301,619 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Address Points" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_address_points_statewide.parquet` | vector | 301,619 | 30.0 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_address_points/statewide/list_address_points_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_address_points/statewide/list_address_points_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_address_points%2Fstatewide%2Flist_address_points_statewide.parquet

## Columns

`GEOCODE_ID` (int32), `GEO_TYPE` (string), `ACCURACY` (string), `RELIABILIT` (string), `EASTING` (double), `NORTHING` (double), `SITE_NAME` (string), `SITE_DESC` (string), `NOM_REG_NO` (string), `FUND_GCODE` (double), `PID` (double), `RA_ADJUST` (double), `UNIT_CODE` (string), `UNIT_TYPE` (string), `UNIT_NUMB` (string), `PROP_NAME` (string), `ST_NO_FROM` (double), `NO1_SUFFIX` (string), `ST_NO_TO` (int32), `NO2_SUFFIX` (string), `STREET` (string), `ST_TY_CODE` (string), `ST_TYPE` (string), `ST_SU_CODE` (string), `ST_SUFFIX` (string), `LOCALITY` (string), `STATE` (string), `POSTCODE` (int32), `RURAL_ADD` (string), `ALTERED_ON` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string)

## Source

- [LIST_ADDRESS_POINTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_ADDRESS_POINTS_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIST Address Points" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

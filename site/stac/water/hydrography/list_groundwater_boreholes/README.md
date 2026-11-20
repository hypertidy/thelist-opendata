# LIST Groundwater Boreholes

LIST Groundwater Boreholes: LIST product `LIST_GROUNDWATER_BOREHOLES`, statewide. 11,856 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Groundwater Boreholes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_groundwater_boreholes_statewide.parquet` | vector | 11,856 | 809.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_groundwater_boreholes/statewide/list_groundwater_boreholes_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_groundwater_boreholes/statewide/list_groundwater_boreholes_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_groundwater_boreholes%2Fstatewide%2Flist_groundwater_boreholes_statewide.parquet

## Columns

`FEATURE_ID` (int32), `FEATURE_PURPOSE` (string), `FEATURE_ACCESS_STATUS` (string), `FEATURE_TYPE_CODE` (string), `BASE_FEATURE_TYPE_CODE` (string), `FEATURE_TYPE` (string), `BASE_FEATURE_TYPE` (string), `LOCALITY_NAME` (string), `EASTING` (double), `NORTHING` (double), `DATUM` (string), `COORD_ACCURACY` (string), `COORD_ACCURACY_NUM` (double), `DRILLED_DATE` (datetime), `DRILLING_COMPANY` (string), `DEPTH` (double), `INITIAL_YIELD` (double), `DRY_BORE` (string), `DTWS_LIST` (string), `SWL_LIST` (string), `LAST_SWL` (double), `LAST_SWL_DATE` (datetime), `FINAL_TDS` (int32), `MAIN_AQUIFER_GEOLOGY` (string), `LAST_OPERATING_STATUS` (string), `LAST_OP_STATUS_DATE` (datetime), `X` (double), `Y` (double)

## Source

- [LIST_GROUNDWATER_BOREHOLES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_GROUNDWATER_BOREHOLES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Groundwater Boreholes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# SES Flood History Cal Studies

SES Flood History Cal Studies: LIST product `SES_FLOOD_HISTORY_CAL_STUDIES`, statewide. 30 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2022-09-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "SES Flood History Cal Studies" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `calibration_catchments.parquet` | vector | 30 | 9.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/ses_flood_history_cal_studies/statewide/calibration_catchments.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/ses_flood_history_cal_studies/statewide/calibration_catchments.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fses_flood_history_cal_studies%2Fstatewide%2Fcalibration_catchments.parquet

## Columns

`OBJECTID` (double), `CAT_ID` (double), `CAT_NAME` (string), `CAT_AREA` (double), `CAT_INFO` (string), `layer` (string), `path` (string), `Cat_areakm` (double), `CFEVcatIDs` (string), `Priority` (string), `Shape_Length` (double), `Shape_Area` (double)

## Source

- [SES_FLOOD_HISTORY_CAL_STUDIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/SES_FLOOD_HISTORY_CAL_STUDIES_STATEWIDE.zip), released 2022-09-16

## Attribution

"SES Flood History Cal Studies" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

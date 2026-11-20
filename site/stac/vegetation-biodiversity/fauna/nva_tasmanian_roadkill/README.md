# NVA Tasmanian Roadkill

NVA Tasmanian Roadkill: LIST product `NVA_TASMANIAN_ROADKILL`, statewide. 74,738 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NVA Tasmanian Roadkill" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nva_tasmanian_roadkill_statewide.parquet` | vector | 74,738 | 5.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/nva_tasmanian_roadkill/statewide/nva_tasmanian_roadkill_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/nva_tasmanian_roadkill/statewide/nva_tasmanian_roadkill_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fnva_tasmanian_roadkill%2Fstatewide%2Fnva_tasmanian_roadkill_statewide.parquet

## Columns

`SPECIES_OBSERVATION_ID` (double), `SPECIES_CODE` (string), `SPECIES_NAME` (string), `PREFERRED_COMMON_NAMES` (string), `OBSERVATION_DATE` (datetime), `OBSERVATION_YEAR` (string), `OBSERVATION_TIME` (string), `DATE_ACCURACY` (string), `OBSERVATION_TYPE` (string), `OBSERVATION_STATE` (string), `POSITION_ACCURACY` (double), `THREATENED` (string), `CONSERVATION_SIGNIFICANCE` (string), `STATE_SCHEDULE` (string), `NATIONAL_SCHEDULE` (string), `INTRODUCED_WATCH_LIST` (string), `NOTES` (string), `LAST_UPDATE_DATE_TIME` (datetime), `LIST_GUID` (string), `CRC_ID` (string)

## Source

- [NVA_TASMANIAN_ROADKILL_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NVA_TASMANIAN_ROADKILL_STATEWIDE.zip), released 2025-07-18

## Attribution

"NVA Tasmanian Roadkill" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

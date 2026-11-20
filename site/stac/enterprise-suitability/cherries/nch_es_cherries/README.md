# NCH ES Cherries

NCH ES Cherries: LIST product `NCH_ES_CHERRIES`, statewide. Attribute table, 68,780 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Cherries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_cherries_lut.parquet` | table | 68,780 | 845.8 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_cherries/statewide/nch_es_cherries_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_cherries%2Fstatewide%2Fnch_es_cherries_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `DEPTH_TO_SODIC_LAYER` (string), `PH_0TO15CM` (string), `ECSE_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `SLOPE_PERCENT` (string), `FROST_RISK_IN_EARLY_BLOOM` (string), `FROST_RISK_AFTER_FRUITSET` (string), `MEAN_MAXIMUM_TEMPERATURE_JAN` (string), `MEAN_MAXIMUM_TEMPERATURE_FEB` (string), `MEAN_MAXIMUM_TEMPERATURE_MAR` (string), `MEAN_MAXIMUM_TEMPERATURE_APR` (string), `MEAN_MAXIMUM_TEMPERATURE_MAY` (string), `MEAN_MAXIMUM_TEMPERATURE_JUN` (string), `MEAN_MAXIMUM_TEMPERATURE_JUL` (string), `MEAN_MAXIMUM_TEMPERATURE_AUG` (string), `MEAN_MAXIMUM_TEMPERATURE_SEP` (string), `MEAN_MAXIMUM_TEMPERATURE_OCT` (string), `MEAN_MAXIMUM_TEMPERATURE_NOV` (string), `MEAN_MAXIMUM_TEMPERATURE_DEV` (string), `MEAN_DAILY_TMAX_AT_FLOWERING` (string), `HEAT_RISK_DURING_RIPENING` (string), `GROWING_DEGREE_DAYS` (string), `CHILL_HOURS` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_CHERRIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_CHERRIES_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Cherries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

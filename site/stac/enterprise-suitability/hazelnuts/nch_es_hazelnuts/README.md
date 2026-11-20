# NCH ES Hazelnuts

NCH ES Hazelnuts: LIST product `NCH_ES_HAZELNUTS`, statewide. Attribute table, 4,720 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Hazelnuts" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_hazelnuts_lut.parquet` | table | 4,720 | 57.0 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_hazelnuts/statewide/nch_es_hazelnuts_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_hazelnuts%2Fstatewide%2Fnch_es_hazelnuts_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `PH_0TO15CM` (string), `EC_0TO15CM` (string), `TEXTURE_CLAY_PERCENT_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `FROST_RISK` (string), `MEAN_MAXIMUM_TEMPERATURE_JAN` (string), `MEAN_MAXIMUM_TEMPERATURE_FEB` (string), `RAINFALL` (string), `CHILL_HOURS` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_HAZELNUTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_HAZELNUTS_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Hazelnuts" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

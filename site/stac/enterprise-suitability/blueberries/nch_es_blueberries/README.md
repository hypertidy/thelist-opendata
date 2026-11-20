# NCH ES Blueberries

NCH ES Blueberries: LIST product `NCH_ES_BLUEBERRIES`, statewide. Attribute table, 2,866 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Blueberries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_blueberries_lut.parquet` | table | 2,866 | 38.2 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_blueberries/statewide/nch_es_blueberries_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_blueberries%2Fstatewide%2Fnch_es_blueberries_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `DEPTH_TO_SODIC_LAYER` (string), `PH_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `SLOPE_PERCENT` (string), `FROST_RISK` (string), `MEAN_MAXIMUM_TEMPERATURE_OCT` (string), `MEAN_MAXIMUM_TEMPERATURE_NOV` (string), `MEAN_MAXIMUM_TEMPERATURE_DEC` (string), `MEAN_MAXIMUM_TEMPERATURE_JAN` (string), `MEAN_MAXIMUM_TEMPERATURE_FEB` (string), `MEAN_MAXIMUM_TEMPERATURE_MAR` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_BLUEBERRIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_BLUEBERRIES_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Blueberries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

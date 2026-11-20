# NCH ES Wheat 2030 A2

NCH ES Wheat 2030 A2: LIST product `NCH_ES_WHEAT_2030_A2`, statewide. Attribute table, 2,033 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Wheat 2030 A2" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_wheat_2030_a2_lut.parquet` | table | 2,033 | 26.5 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_wheat_2030_a2/statewide/nch_es_wheat_2030_a2_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_wheat_2030_a2%2Fstatewide%2Fnch_es_wheat_2030_a2_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `DEPTH_TO_SODIC_LAYER` (string), `PH_0TO15CM` (string), `ECSE_0TO15CM` (string), `TEXTURE_CLAY_PERCENT_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `SLOPE_PERCENT` (string), `FROST_RISK` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_WHEAT_2030_A2_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_WHEAT_2030_A2_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Wheat 2030 A2" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

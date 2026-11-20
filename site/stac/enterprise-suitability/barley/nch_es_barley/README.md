# NCH ES Barley

NCH ES Barley: LIST product `NCH_ES_BARLEY`, statewide. Attribute table, 1,982 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Barley" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_barley_2030_a2_lut.parquet` | table | 1,982 | 26.1 KB |
| `nch_es_barley_2030_b1_lut.parquet` | table | 2,079 | 27.3 KB |
| `nch_es_barley_2050_a2_lut.parquet` | table | 1,652 | 23.2 KB |
| `nch_es_barley_2050_b1_lut.parquet` | table | 1,791 | 24.4 KB |
| `nch_es_barley_lut.parquet` | table | 2,379 | 30.0 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_barley/statewide/nch_es_barley_2030_a2_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_barley%2Fstatewide%2Fnch_es_barley_2030_a2_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `DEPTH_TO_SODIC_LAYER` (string), `PH_0TO15CM` (string), `ECSE_0TO15CM` (string), `TEXTURE_CLAY_PERCENT_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `SLOPE_PERCENT` (string), `FROST_RISK` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_BARLEY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_BARLEY_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Barley" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

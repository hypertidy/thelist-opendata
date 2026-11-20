# NCH ES S Wine Grapes

NCH ES S Wine Grapes: LIST product `NCH_ES_S_WINE_GRAPES`, statewide. Attribute table, 53 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES S Wine Grapes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_s_wine_grapes_lut.parquet` | table | 53 | 6.4 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_s_wine_grapes/statewide/nch_es_s_wine_grapes_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_s_wine_grapes%2Fstatewide%2Fnch_es_s_wine_grapes_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY` (string), `LIMITINGFACTOR` (string), `RAINFALL` (string), `FROST_LTM1` (string), `GST` (string), `FLOODING` (string), `LEVEL_` (int16)

## Source

- [NCH_ES_S_WINE_GRAPES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_S_WINE_GRAPES_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES S Wine Grapes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

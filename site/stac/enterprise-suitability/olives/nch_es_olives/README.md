# NCH ES Olives

NCH ES Olives: LIST product `NCH_ES_OLIVES`, statewide. Attribute table, 7,942 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Olives" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_olives_lut.parquet` | table | 7,942 | 84.2 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_olives/statewide/nch_es_olives_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_olives%2Fstatewide%2Fnch_es_olives_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `PH_0TO15CM` (string), `ECSE_0TO15CM` (string), `DRAINAGE_CLASS` (string), `SLOPE_PERCENT` (string), `ASPECT` (string), `FROST_RISK` (string), `RAINFALL` (string), `CHILL_HOURS` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_OLIVES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_OLIVES_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Olives" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

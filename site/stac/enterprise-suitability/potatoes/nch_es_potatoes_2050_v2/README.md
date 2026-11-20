# NCH ES Potatoes 2050 V2

NCH ES Potatoes 2050 V2: LIST product `NCH_ES_POTATOES_2050_V2`, statewide. Attribute table, 11,468 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-25. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Potatoes 2050 V2" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_potatoes_2050_lut_v2.parquet` | table | 11,468 | 125.7 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_potatoes_2050_v2/statewide/nch_es_potatoes_2050_lut_v2.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_potatoes_2050_v2%2Fstatewide%2Fnch_es_potatoes_2050_lut_v2.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY` (string), `CONTRAINTS` (string), `MANAGEABLE_CONSTRAINTS` (string), `SOILDEPTH` (string), `PH` (string), `ECSE` (string), `TEXTURE` (string), `DRAINAGE` (string), `STONINESS` (string), `SLOPE` (string), `FROST` (string), `HEAT` (string), `DUPLEXCLAY` (string), `FLOODING` (string)

## Source

- [NCH_ES_POTATOES_2050_V2_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_POTATOES_2050_V2_STATEWIDE.zip), released 2020-06-25

## Attribution

"NCH ES Potatoes 2050 V2" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# NCH ES Cherries V3

NCH ES Cherries V3: LIST product `NCH_ES_CHERRIES_V3`, statewide. Attribute table, 85,005 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Cherries V3" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_cherries_lut_v3.parquet` | table | 85,005 | 1.0 MB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_cherries_v3/statewide/nch_es_cherries_lut_v3.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_cherries_v3%2Fstatewide%2Fnch_es_cherries_lut_v3.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY` (string), `CONTRAINTS` (string), `MANAGEABLE_CONSTRAINTS` (string), `SOILDEPTH` (string), `DEPTH2SODIC` (string), `PH` (string), `EC` (string), `DRAINAGE` (string), `STONINESS` (string), `SLOPE` (string), `FROST_BLOOM` (string), `FROST_FRUITSET` (string), `TMAX_MONTHLY` (string), `TMAX_FLO` (string), `TMAX_RIP` (string), `GDD` (string), `CHILL_HOURS` (string), `FLOODING` (string)

## Source

- [NCH_ES_CHERRIES_V3_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_CHERRIES_V3_STATEWIDE.zip), released 2020-06-24

## Attribution

"NCH ES Cherries V3" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

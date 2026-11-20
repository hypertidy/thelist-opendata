# NCH ES Raspberries V2

NCH ES Raspberries V2: LIST product `NCH_ES_RASPBERRIES_V2`, statewide. Attribute table, 145,550 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Raspberries V2" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_raspberries_lut_v2.parquet` | table | 145,550 | 1.7 MB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_raspberries_v2/statewide/nch_es_raspberries_lut_v2.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_raspberries_v2%2Fstatewide%2Fnch_es_raspberries_lut_v2.parquet

## Columns

`OBJECTID` (int64), `ID` (double), `SUITABILITY` (string), `CONTRAINTS` (string), `MANAGEABLE_CONSTRAINTS` (string), `SOILDEPTH` (string), `PH` (string), `EC` (string), `DRAINAGE` (string), `STONINESS` (string), `SLOPE` (string), `FROST` (string), `CHILL_HOURS` (string), `HEAT` (string), `SODICHAZARD` (string), `SALINITYHAZARD` (string), `WATEREROSION` (string), `WATERLOGGING` (string), `WINDEROSION` (string), `FLOODING` (string)

## Source

- [NCH_ES_RASPBERRIES_V2_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_RASPBERRIES_V2_STATEWIDE.zip), released 2020-06-24

## Attribution

"NCH ES Raspberries V2" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

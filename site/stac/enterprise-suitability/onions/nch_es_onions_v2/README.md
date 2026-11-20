# NCH ES Onions V2

NCH ES Onions V2: LIST product `NCH_ES_ONIONS_V2`, statewide. Attribute table, 304,543 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Onions V2" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_onions_lut_v2.parquet` | table | 304,543 | 3.5 MB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_onions_v2/statewide/nch_es_onions_lut_v2.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_onions_v2%2Fstatewide%2Fnch_es_onions_lut_v2.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY` (string), `CONTRAINTS` (string), `MANAGEABLE_CONSTRAINTS` (string), `SOILDEPTH` (string), `PH` (string), `EC` (string), `DRAINAGE` (string), `STONINESS` (string), `SLOPE` (string), `EXCH_CA` (string), `EXCH_MG` (string), `HEAT` (string), `RAINFALL` (string), `FROST` (string), `SODICHAZARD` (string), `SALINITYHAZARD` (string), `WATEREROSION` (string), `WATERLOGGING` (string), `WINDEROSION` (string), `FLOODING` (string)

## Source

- [NCH_ES_ONIONS_V2_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_ONIONS_V2_STATEWIDE.zip), released 2020-06-24

## Attribution

"NCH ES Onions V2" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

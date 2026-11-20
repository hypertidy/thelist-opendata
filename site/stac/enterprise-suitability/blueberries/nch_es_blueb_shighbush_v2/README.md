# NCH ES Blueb Shighbush V2

NCH ES Blueb Shighbush V2: LIST product `NCH_ES_BLUEB_SHIGHBUSH_V2`, statewide. Attribute table, 62,493 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Blueb Shighbush V2" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_blueb_shighbush_lut_v2.parquet` | table | 62,493 | 722.9 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_blueb_shighbush_v2/statewide/nch_es_blueb_shighbush_lut_v2.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_blueb_shighbush_v2%2Fstatewide%2Fnch_es_blueb_shighbush_lut_v2.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY` (string), `CONTRAINTS` (string), `MANAGEABLE_CONSTRAINTS` (string), `SOILDEPTH` (string), `DEPTH2SOD` (string), `PH` (string), `DRAINAGE` (string), `STONINESS` (string), `SLOPE` (string), `FROST` (string), `TMAX_OCT` (string), `TMAX_NOV` (string), `TMAX_DEC` (string), `TMAX_JAN` (string), `TMAX_FEB` (string), `TMAX_MAR` (string), `CHILL_HOURS` (string), `SODICHAZARD` (string), `SALINITYHAZARD` (string), `WATEREROSION` (string), `WATERLOGGING` (string), `WINDEROSION` (string), `FLOODING` (string)

## Source

- [NCH_ES_BLUEB_SHIGHBUSH_V2_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_BLUEB_SHIGHBUSH_V2_STATEWIDE.zip), released 2020-06-24

## Attribution

"NCH ES Blueb Shighbush V2" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

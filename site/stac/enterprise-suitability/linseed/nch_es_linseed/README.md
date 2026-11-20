# NCH ES Linseed

NCH ES Linseed: LIST product `NCH_ES_LINSEED`, statewide. Attribute table, 997 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Linseed" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_linseed_lut.parquet` | table | 997 | 15.4 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_linseed/statewide/nch_es_linseed_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_linseed%2Fstatewide%2Fnch_es_linseed_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `SOIL_DEPTH_CM` (string), `DEPTH_TO_SODIC_LAYER` (string), `PH_0TO15CM` (string), `ECSE_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `FROST_RISK` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_LINSEED_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_LINSEED_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Linseed" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

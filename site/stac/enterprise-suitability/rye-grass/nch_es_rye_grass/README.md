# NCH ES Rye Grass

NCH ES Rye Grass: LIST product `NCH_ES_RYE_GRASS`, statewide. Attribute table, 267 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Rye Grass" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_rye_grass_lut.parquet` | table | 267 | 7.3 KB |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/nch_es_rye_grass/statewide/nch_es_rye_grass_lut.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fnch_es_rye_grass%2Fstatewide%2Fnch_es_rye_grass_lut.parquet

## Columns

`OBJECTID` (int64), `ID` (int32), `SUITABILITY_CATEGORY` (string), `LIMITING_FACTORS` (string), `PH_0TO15CM` (string), `ECSE_0TO15CM` (string), `DRAINAGE_CLASS` (string), `COARSE_FRAGMENT_CLASS_0TO15CM` (string), `FLOOD_RISK` (string)

## Source

- [NCH_ES_RYE_GRASS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_RYE_GRASS_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH ES Rye Grass" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

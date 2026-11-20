# Land Potentially Suitable For Agriculture

Land Potentially Suitable For Agriculture: LIST product `LAND_POTENTIALLY_SUITABLE_FOR_AGRICULTURE`, statewide. Attribute table, 0 rows. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-01-13. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Land Potentially Suitable For Agriculture" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `external_staging.parquet` | table | 0 | 636 B |

## Read it in place

```sql
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/parquet/land_potentially_suitable_for_agriculture/statewide/external_staging.parquet') LIMIT 10;
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#parquet%2Fland_potentially_suitable_for_agriculture%2Fstatewide%2Fexternal_staging.parquet

## Columns

`OBJECTID` (int64)

## Source

- [LAND_POTENTIALLY_SUITABLE_FOR_AGRICULTURE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LAND_POTENTIALLY_SUITABLE_FOR_AGRICULTURE_STATEWIDE.zip), released 2023-01-13

## Attribution

"Land Potentially Suitable For Agriculture" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

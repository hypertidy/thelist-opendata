# EPA Swimming Beaches And Monitored Recreational Waters During Summer Period

EPA Swimming Beaches And Monitored Recreational Waters During Summer Period: LIST product `EPA_SWIMMING_BEACHES_AND_MONITORED_RECREATIONAL_WATERS_DURING_SUMMER_PERIOD`, statewide. 1 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "EPA Swimming Beaches And Monitored Recreational Waters During Summer Period" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `epa_swimming_beaches_and_monitored_recreational_waters_during_summer_period_statewide.parquet` | vector | 1 | 387.2 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_swimming_beaches_and_monitored_recreational_waters_during_summer_period/statewide/epa_swimming_beaches_and_monitored_recreational_waters_during_summer_period_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_swimming_beaches_and_monitored_recreational_waters_during_summer_period/statewide/epa_swimming_beaches_and_monitored_recreational_waters_during_summer_period_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fepa_swimming_beaches_and_monitored_recreational_waters_during_summer_period%2Fstatewide%2Fepa_swimming_beaches_and_monitored_recreational_waters_during_summer_period_statewide.parquet

## Columns

`BEACH` (string), `DIRECTIVE` (string), `DESCRIPTOR` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [EPA_SWIMMING_BEACHES_AND_MONITORED_RECREATIONAL_WATERS_DURING_SUMMER_PERIOD_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/EPA_SWIMMING_BEACHES_AND_MONITORED_RECREATIONAL_WATERS_DURING_SUMMER_PERIOD_STATEWIDE.zip), released 2025-07-17

## Attribution

"EPA Swimming Beaches And Monitored Recreational Waters During Summer Period" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

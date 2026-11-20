# Recreational Fishing Restrictions

Recreational Fishing Restrictions: LIST product `RECREATIONAL_FISHING_RESTRICTIONS`, statewide. 209 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Recreational Fishing Restrictions" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `recreational_fishing_restrictions_statewide.parquet` | vector | 209 | 3.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/recreational_fishing_restrictions/statewide/recreational_fishing_restrictions_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/recreational_fishing_restrictions/statewide/recreational_fishing_restrictions_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Frecreational_fishing_restrictions%2Fstatewide%2Frecreational_fishing_restrictions_statewide.parquet

## Columns

`ID` (double), `AREA_NAME` (string), `DESCRIPTION` (string), `MARINE_NATURE_RESERVE_NO_FISH` (string), `MARINE_NATURE_RESERVE_RESTRICT` (string), `SHARK_REFUGE_AREA` (string), `RESEARCH_AREA` (string), `NO_GRABALL_NET` (string), `NO_MULLET_NET` (string), `NO_BEACH_SEINE` (string), `NO_SET_LINE` (string), `NO_BAIT_NET` (string), `NO_BAIT_TRAP` (string), `NO_SPEARS` (string), `INLAND_WATERS` (string), `MARINE_FISH_ZONE` (string), `BREAM_FISH_AREA` (string), `NO_ANCHORING_OR_DIVING` (string), `NO_TAKE_BY_DIVING` (string), `ABALONE_NO_TAKE` (string), `ABALONE_NO_TAKE_AND_POSSESSION` (string), `NO_ROCK_LOBSTER_FISHING` (string), `ROCK_LOBSTER_NO_POSSESSION` (string), `NO_ROCK_LOBSTER_POTS` (string), `SCALLOP_MANAGED_AREA` (string), `SQUID_SEASONAL_CLOSURE` (string), `HEALTH_WARNING` (string), `NO_CAST_NET` (string), `NO_ROCK_LOBSTER_RINGS` (string), `SCALLOP_NO_TAKE` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [RECREATIONAL_FISHING_RESTRICTIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/RECREATIONAL_FISHING_RESTRICTIONS_STATEWIDE.zip), released 2025-07-17

## Attribution

"Recreational Fishing Restrictions" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Interim Planning Scheme Zone Boundaries

Interim Planning Scheme Zone Boundaries: LIST product `INTERIM_PLANNING_SCHEME_ZONE_BOUNDARIES`, statewide. 79 features, multi-linestring (EPSG:28355+5711). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-08-20. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Interim Planning Scheme Zone Boundaries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `interim_planning_scheme_zone_boundaries_statewide.parquet` | vector | 79 | 36.4 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/interim_planning_scheme_zone_boundaries/statewide/interim_planning_scheme_zone_boundaries_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/interim_planning_scheme_zone_boundaries/statewide/interim_planning_scheme_zone_boundaries_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Finterim_planning_scheme_zone_boundaries%2Fstatewide%2Finterim_planning_scheme_zone_boundaries_statewide.parquet

## Columns

`DESC_` (string), `SCHEMECODE` (int16), `PLANSCHEME` (string), `SCHEMEDATE` (datetime), `COMMENTS` (string), `DISCLAIMER` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double)

## Source

- [INTERIM_PLANNING_SCHEME_ZONE_BOUNDARIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/INTERIM_PLANNING_SCHEME_ZONE_BOUNDARIES_STATEWIDE.zip), released 2026-08-20

## Attribution

"Interim Planning Scheme Zone Boundaries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

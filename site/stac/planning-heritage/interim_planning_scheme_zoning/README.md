# Interim Planning Scheme Zoning

Interim Planning Scheme Zoning: LIST product `INTERIM_PLANNING_SCHEME_ZONING`, statewide. 743 features, multi-polygon (EPSG:28355+5711). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-08-20. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Interim Planning Scheme Zoning" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `interim_planning_scheme_zoning_statewide.parquet` | vector | 743 | 1.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/interim_planning_scheme_zoning/statewide/interim_planning_scheme_zoning_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/interim_planning_scheme_zoning/statewide/interim_planning_scheme_zoning_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Finterim_planning_scheme_zoning%2Fstatewide%2Finterim_planning_scheme_zoning_statewide.parquet

## Columns

`ZONECODE` (int16), `ZONE` (string), `SCHEMECODE` (int16), `PLANSCHEME` (string), `SCHEMEDATE` (datetime), `COMMENTS` (string), `DISCLAIMER` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [INTERIM_PLANNING_SCHEME_ZONING_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/INTERIM_PLANNING_SCHEME_ZONING_STATEWIDE.zip), released 2026-08-20

## Attribution

"Interim Planning Scheme Zoning" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Tasmanian Planning Scheme Zone Boundaries

Tasmanian Planning Scheme Zone Boundaries: LIST product `TASMANIAN_PLANNING_SCHEME_ZONE_BOUNDARIES`, statewide. 4,031 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-08-20. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasmanian Planning Scheme Zone Boundaries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasmanian_planning_scheme_zone_boundaries_statewide.parquet` | vector | 4,031 | 1.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmanian_planning_scheme_zone_boundaries/statewide/tasmanian_planning_scheme_zone_boundaries_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmanian_planning_scheme_zone_boundaries/statewide/tasmanian_planning_scheme_zone_boundaries_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasmanian_planning_scheme_zone_boundaries%2Fstatewide%2Ftasmanian_planning_scheme_zone_boundaries_statewide.parquet

## Columns

`LPS_NO` (int16), `LPS` (string), `DESCRIPT` (string), `CAD_DEP` (string), `AMENDREF` (string), `NOTES` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double)

## Source

- [TASMANIAN_PLANNING_SCHEME_ZONE_BOUNDARIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASMANIAN_PLANNING_SCHEME_ZONE_BOUNDARIES_STATEWIDE.zip), released 2026-08-20

## Attribution

"Tasmanian Planning Scheme Zone Boundaries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Interim Planning Scheme Overlay

Interim Planning Scheme Overlay: LIST product `INTERIM_PLANNING_SCHEME_OVERLAY`, statewide. 1,577,557 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-12-21. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Interim Planning Scheme Overlay" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `interim_planning_scheme_overlay_statewide.gdb.parquet` | vector | 1,577,557 | 317.4 MB |
| `interim_planning_scheme_overlay_statewide.parquet` | vector | 1,577,557 | 316.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/interim_planning_scheme_overlay/statewide/interim_planning_scheme_overlay_statewide.gdb.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/interim_planning_scheme_overlay/statewide/interim_planning_scheme_overlay_statewide.gdb.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Finterim_planning_scheme_overlay%2Fstatewide%2Finterim_planning_scheme_overlay_statewide.gdb.parquet

## Columns

`O_CODE` (string), `O_NAME` (string), `SCHEMECODE` (int16), `PLANSCHEME` (string), `DESC_` (string), `CLASS` (string), `SCHEMEDATE` (datetime), `COMMENTS` (string), `DISCLAIMER` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `SHAPE` (binary)

## Source

- [interim_planning_scheme_overlay_statewide.gdb](https://listdata.thelist.tas.gov.au/opendata/data/interim_planning_scheme_overlay_statewide.gdb/), released 

## Attribution

"Interim Planning Scheme Overlay" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

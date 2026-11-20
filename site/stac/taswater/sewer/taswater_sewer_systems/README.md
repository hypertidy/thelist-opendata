# TASWATER Sewer Systems

TASWATER Sewer Systems: LIST product `TASWATER_SEWER_SYSTEMS`, statewide. 116 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-09-25. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TASWATER Sewer Systems" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `taswater_sewer_systems_statewide.parquet` | vector | 116 | 91.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/taswater_sewer_systems/statewide/taswater_sewer_systems_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/taswater_sewer_systems/statewide/taswater_sewer_systems_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftaswater_sewer_systems%2Fstatewide%2Ftaswater_sewer_systems_statewide.parquet

## Columns

`TPASSETNO` (string), `NAME` (string), `AREAID` (string), `COMMENTS` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASWATER_SEWER_SYSTEMS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASWATER_SEWER_SYSTEMS_STATEWIDE.zip), released 2020-09-25

## Attribution

"TASWATER Sewer Systems" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

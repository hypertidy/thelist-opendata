# TASWATER Sewer Operational Areas

TASWATER Sewer Operational Areas: LIST product `TASWATER_SEWER_OPERATIONAL_AREAS`, statewide. 112 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TASWATER Sewer Operational Areas" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `taswater_sewer_operational_areas_statewide.parquet` | vector | 112 | 96.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/taswater_sewer_operational_areas/statewide/taswater_sewer_operational_areas_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/taswater_sewer_operational_areas/statewide/taswater_sewer_operational_areas_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftaswater_sewer_operational_areas%2Fstatewide%2Ftaswater_sewer_operational_areas_statewide.parquet

## Columns

`CRC_ID` (string), `TPASSETNO` (string), `NAME` (string), `AREAID` (string), `COMMENTS` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASWATER_SEWER_OPERATIONAL_AREAS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASWATER_SEWER_OPERATIONAL_AREAS_STATEWIDE.zip), released 2025-07-17

## Attribution

"TASWATER Sewer Operational Areas" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

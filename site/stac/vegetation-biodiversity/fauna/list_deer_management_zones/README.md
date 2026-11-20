# LIST Deer Management Zones

LIST Deer Management Zones: LIST product `LIST_DEER_MANAGEMENT_ZONES`, statewide. 14 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-11-25. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Deer Management Zones" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_deer_management_zones_statewide.parquet` | vector | 14 | 481.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_deer_management_zones/statewide/list_deer_management_zones_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_deer_management_zones/statewide/list_deer_management_zones_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_deer_management_zones%2Fstatewide%2Flist_deer_management_zones_statewide.parquet

## Columns

`ZONE` (int32), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_DEER_MANAGEMENT_ZONES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEER_MANAGEMENT_ZONES_STATEWIDE.zip), released 2025-11-25

## Attribution

"LIST Deer Management Zones" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

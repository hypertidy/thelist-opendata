# LIST Shellmap Harvest Area Boundaries

LIST Shellmap Harvest Area Boundaries: LIST product `LIST_SHELLMAP_HARVEST_AREA_BOUNDARIES`, statewide. 58 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Shellmap Harvest Area Boundaries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_shellmap_harvest_area_boundaries_statewide.parquet` | vector | 58 | 463.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_shellmap_harvest_area_boundaries/statewide/list_shellmap_harvest_area_boundaries_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_shellmap_harvest_area_boundaries/statewide/list_shellmap_harvest_area_boundaries_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_shellmap_harvest_area_boundaries%2Fstatewide%2Flist_shellmap_harvest_area_boundaries_statewide.parquet

## Columns

`HA_NAME` (string), `GA_NAME` (string), `AREA_HA` (double), `LINK` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_SHELLMAP_HARVEST_AREA_BOUNDARIES_STATEWIDe_old.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SHELLMAP_HARVEST_AREA_BOUNDARIES_STATEWIDe_old.zip), released 2025-07-18

## Attribution

"LIST Shellmap Harvest Area Boundaries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

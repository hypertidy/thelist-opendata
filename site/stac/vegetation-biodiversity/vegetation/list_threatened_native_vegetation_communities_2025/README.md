# LIST Threatened Native Vegetation Communities 2025

LIST Threatened Native Vegetation Communities 2025: LIST product `LIST_THREATENED_NATIVE_VEGETATION_COMMUNITIES_2025`, statewide. 50,187 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-05-28. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Threatened Native Vegetation Communities 2025" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_threatened_native_vegetation_communities_statewide.parquet` | vector | 50,187 | 48.7 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_threatened_native_vegetation_communities_2025/statewide/list_threatened_native_vegetation_communities_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_threatened_native_vegetation_communities_2025/statewide/list_threatened_native_vegetation_communities_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_threatened_native_vegetation_communities_2025%2Fstatewide%2Flist_threatened_native_vegetation_communities_statewide.parquet

## Columns

`SCHED_NAME` (string), `SCHED_ID` (string), `AREA_HA` (double), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_THREATENED_NATIVE_VEGETATION_COMMUNITIES_2025_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_THREATENED_NATIVE_VEGETATION_COMMUNITIES_2025_STATEWIDE.zip), released 2026-05-28

## Attribution

"LIST Threatened Native Vegetation Communities 2025" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

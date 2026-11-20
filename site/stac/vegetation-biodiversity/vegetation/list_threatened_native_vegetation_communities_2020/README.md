# LIST Threatened Native Vegetation Communities 2020

LIST Threatened Native Vegetation Communities 2020: LIST product `LIST_THREATENED_NATIVE_VEGETATION_COMMUNITIES_2020`, statewide. 34,528 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-06-05. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Threatened Native Vegetation Communities 2020" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_threatened_native_vegetation_communities_2020_statewide.parquet` | vector | 34,528 | 26.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_threatened_native_vegetation_communities_2020/statewide/list_threatened_native_vegetation_communities_2020_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_threatened_native_vegetation_communities_2020/statewide/list_threatened_native_vegetation_communities_2020_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_threatened_native_vegetation_communities_2020%2Fstatewide%2Flist_threatened_native_vegetation_communities_2020_statewide.parquet

## Columns

`SCHED_NAME` (string), `SCHED_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_THREATENED_NATIVE_VEGETATION_COMMUNITIES_2020_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_THREATENED_NATIVE_VEGETATION_COMMUNITIES_2020_STATEWIDE.zip), released 2026-06-05

## Attribution

"LIST Threatened Native Vegetation Communities 2020" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

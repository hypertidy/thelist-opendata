# LIST Tasnetworks Tower Ocations

LIST Tasnetworks Tower Ocations: LIST product `LIST_TASNETWORKS_TOWER_OCATIONS`, statewide. 9,108 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-05-20. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasnetworks Tower Ocations" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasnetworks_tower_ocations_statewide.parquet` | vector | 9,108 | 349.9 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_tower_ocations/statewide/list_tasnetworks_tower_ocations_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_tower_ocations/statewide/list_tasnetworks_tower_ocations_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasnetworks_tower_ocations%2Fstatewide%2Flist_tasnetworks_tower_ocations_statewide.parquet

## Columns

`LOCATION_ID` (string)

## Source

- [LIST_TASNETWORKS_TOWER_OCATIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASNETWORKS_TOWER_OCATIONS_STATEWIDE.zip), released 2025-05-20

## Attribution

"LIST Tasnetworks Tower Ocations" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

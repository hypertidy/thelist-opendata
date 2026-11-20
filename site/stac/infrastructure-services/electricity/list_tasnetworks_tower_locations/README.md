# LIST Tasnetworks Tower Locations

LIST Tasnetworks Tower Locations: LIST product `LIST_TASNETWORKS_TOWER_LOCATIONS`, statewide. 9,108 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasnetworks Tower Locations" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasnetworks_tower_locations_statewide.parquet` | vector | 9,108 | 349.9 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_tower_locations/statewide/list_tasnetworks_tower_locations_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_tower_locations/statewide/list_tasnetworks_tower_locations_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasnetworks_tower_locations%2Fstatewide%2Flist_tasnetworks_tower_locations_statewide.parquet

## Columns

`LOCATION_ID` (string)

## Source

- [LIST_TASNETWORKS_TOWER_LOCATIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASNETWORKS_TOWER_LOCATIONS_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Tasnetworks Tower Locations" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Tasnetworks Substation Locations

LIST Tasnetworks Substation Locations: LIST product `LIST_TASNETWORKS_SUBSTATION_LOCATIONS`, statewide. 98 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasnetworks Substation Locations" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasnetworks_substation_locations_statewide.parquet` | vector | 98 | 11.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_substation_locations/statewide/list_tasnetworks_substation_locations_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_substation_locations/statewide/list_tasnetworks_substation_locations_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasnetworks_substation_locations%2Fstatewide%2Flist_tasnetworks_substation_locations_statewide.parquet

## Columns

`NAME` (string)

## Source

- [LIST_TASNETWORKS_SUBSTATION_LOCATIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASNETWORKS_SUBSTATION_LOCATIONS_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Tasnetworks Substation Locations" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

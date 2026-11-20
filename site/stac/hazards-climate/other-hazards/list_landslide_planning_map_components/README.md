# LIST Landslide Planning Map Components

LIST Landslide Planning Map Components: LIST product `LIST_LANDSLIDE_PLANNING_MAP_COMPONENTS`, statewide. 1,388,657 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-10-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Landslide Planning Map Components" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_landslide_planning_map_components_statewide.parquet` | vector | 1,388,657 | 130.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_landslide_planning_map_components/statewide/list_landslide_planning_map_components_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_landslide_planning_map_components/statewide/list_landslide_planning_map_components_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_landslide_planning_map_components%2Fstatewide%2Flist_landslide_planning_map_components_statewide.parquet

## Columns

`HAZARD_BAND_1` (string), `COMPONENT` (string), `NAME` (string), `NAME_1` (string), `REGION` (string), `HAZARD_EXPOSURE` (string), `VERSION` (string), `VERSION_DATE` (string), `FURTHER_INFORMATION` (string), `LIST_GUID` (string), `DISCLAIMER` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LANDSLIDE_PLANNING_MAP_COMPONENTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_COMPONENTS_STATEWIDE.zip), released 2019-10-16

## Attribution

"LIST Landslide Planning Map Components" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Coastal Erosion Component 20161201

LIST Coastal Erosion Component 20161201: LIST product `LIST_COASTAL_EROSION_COMPONENT_20161201`, statewide. 19,479 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-10-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Coastal Erosion Component 20161201" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_coastal_erosion_component_20161201_statewide.parquet` | vector | 19,479 | 32.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_erosion_component_20161201/statewide/list_coastal_erosion_component_20161201_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_erosion_component_20161201/statewide/list_coastal_erosion_component_20161201_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_coastal_erosion_component_20161201%2Fstatewide%2Flist_coastal_erosion_component_20161201_statewide.parquet

## Columns

`DISCLAIMER` (string), `HAZARD_BAND` (string), `COMPONENT_1` (string), `VERSION` (string), `DATE_` (string), `LINK` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_COASTAL_EROSION_COMPONENT_20161201_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COASTAL_EROSION_COMPONENT_20161201_STATEWIDE.zip), released 2019-10-16

## Attribution

"LIST Coastal Erosion Component 20161201" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

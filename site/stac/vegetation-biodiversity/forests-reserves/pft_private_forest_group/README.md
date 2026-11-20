# Pft Private Forest Group

Pft Private Forest Group: LIST product `PFT_PRIVATE_FOREST_GROUP`, statewide. 126,488 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Pft Private Forest Group" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `pft_private_forest_group_statewide.parquet` | vector | 126,488 | 351.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/pft_private_forest_group/statewide/pft_private_forest_group_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/pft_private_forest_group/statewide/pft_private_forest_group_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fpft_private_forest_group%2Fstatewide%2Fpft_private_forest_group_statewide.parquet

## Columns

`FORGROUP` (string), `FORGROUP_DESC` (string), `CURRENCY` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [PFT_PRIVATE_FOREST_GROUP_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/PFT_PRIVATE_FOREST_GROUP_STATEWIDE.zip), released 2025-07-18

## Attribution

"Pft Private Forest Group" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

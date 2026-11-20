# LIST Named Feature Extent

LIST Named Feature Extent: LIST product `LIST_NAMED_FEATURE_EXTENT`, statewide. 7,344 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-06-08. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Named Feature Extent" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_named_feature_extent_statewide.parquet` | vector | 7,344 | 5.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_named_feature_extent/statewide/list_named_feature_extent_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_named_feature_extent/statewide/list_named_feature_extent_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_named_feature_extent%2Fstatewide%2Flist_named_feature_extent_statewide.parquet

## Columns

`FEATEXT_ID` (int32), `NOM_REG_NO` (string), `NAME` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `FEAT_TYPE` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_NAMED_FEATURE_EXTENT_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_NAMED_FEATURE_EXTENT_STATEWIDE.zip), released 2023-06-08

## Attribution

"LIST Named Feature Extent" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

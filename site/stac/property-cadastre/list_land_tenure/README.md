# LIST Land Tenure

LIST Land Tenure: LIST product `LIST_LAND_TENURE`, statewide. 46,642 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Tenure" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_tenure_statewide.parquet` | vector | 46,642 | 57.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_tenure/statewide/list_land_tenure_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_tenure/statewide/list_land_tenure_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_tenure%2Fstatewide%2Flist_land_tenure_statewide.parquet

## Columns

`TEN_CLASS` (string), `ACT` (string), `FEAT_NAME` (string), `TENURE_ID` (int32), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_TENURE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_TENURE_STATEWIDE.zip), released 2025-07-09

## Attribution

"LIST Land Tenure" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

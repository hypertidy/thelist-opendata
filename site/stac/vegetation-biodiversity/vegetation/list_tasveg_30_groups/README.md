# LIST TASVEG 30 Groups

LIST TASVEG 30 Groups: LIST product `LIST_TASVEG_30_GROUPS`, statewide. 235,726 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-01-30. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 30 Groups" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasveg_30_groups_statewide.parquet` | vector | 235,726 | 229.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_30_groups/statewide/list_tasveg_30_groups_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_30_groups/statewide/list_tasveg_30_groups_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_30_groups%2Fstatewide%2Flist_tasveg_30_groups_statewide.parquet

## Columns

`VEG_GROUP` (string), `LGA_NAME` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASVEG_30_GROUPS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_30_GROUPS_STATEWIDE.zip), released 2018-01-30

## Attribution

"LIST TASVEG 30 Groups" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

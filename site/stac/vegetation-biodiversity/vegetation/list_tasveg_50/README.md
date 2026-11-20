# LIST TASVEG 50

LIST TASVEG 50: LIST product `LIST_TASVEG_50`, statewide. 482,138 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-12-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 50" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasveg_5_0.parquet` | vector | 482,138 | 488.6 MB |
| `tasveg_5_0_fire_attributes_lut.parquet` | table | 159 | 9.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_50/statewide/tasveg_5_0.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_50/statewide/tasveg_5_0.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_50%2Fstatewide%2Ftasveg_5_0.parquet

## Columns

`VEG_GRP_CODE` (int16), `VEGCODE` (string), `FOREST_STRUCT` (string), `NOTABLE_TREE` (string), `SOURCE_TYPE` (string), `SOURCE_DATE` (datetime), `FIELD_CHECK` (datetime), `SOURCE_IRS` (float), `PROJECT` (string), `WEED_TYPE` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASVEG_50_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_50_STATEWIDE.zip), released 2025-12-04

## Attribution

"LIST TASVEG 50" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

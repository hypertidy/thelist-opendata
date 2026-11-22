# TASVEG 5 Release

TASVEG 5 Release: LIST product `TASVEG_5_RELEASE`, statewide. 482,138 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. LIST gives no release date for the source. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TASVEG 5 Release" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasveg_5_release.gdb.parquet` | vector | 482,138 | 488.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasveg_5_release/statewide/tasveg_5_release.gdb.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasveg_5_release/statewide/tasveg_5_release.gdb.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasveg_5_release%2Fstatewide%2Ftasveg_5_release.gdb.parquet

## Columns

`VEG_GRP_CODE` (int16), `VEGCODE` (string), `FOREST_STRUCT` (string), `NOTABLE_TREE` (string), `SOURCE_TYPE` (string), `SOURCE_DATE` (datetime), `FIELD_CHECK` (datetime), `SOURCE_IRS` (float), `PROJECT` (string), `WEED_TYPE` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `SHAPE` (binary)

## Source

- [TASVEG_5_release.gdb](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_50_STATEWIDE/TASVEG_5_release.gdb/), released 

## Attribution

"TASVEG 5 Release" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

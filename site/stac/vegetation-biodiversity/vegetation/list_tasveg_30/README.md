# LIST TASVEG 30

LIST TASVEG 30: LIST product `LIST_TASVEG_30`, statewide. 446,694 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-01-19. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 30" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasveg_30_statewide.parquet` | vector | 446,694 | 328.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_30/statewide/list_tasveg_30_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_30/statewide/list_tasveg_30_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_30%2Fstatewide%2Flist_tasveg_30_statewide.parquet

## Columns

`VEGCODE` (string), `FOREST_STR` (string), `SOURCE_DAT` (datetime), `FIELD_CHEC` (datetime), `PROJECT` (string), `EMERG_TREE` (string), `SOURCE_TYP` (string), `SOURCE_IRS` (double), `VEGCODE_D` (string), `VEG_GROUP` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASVEG_30_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_30_STATEWIDE.zip), released 2018-01-19

## Attribution

"LIST TASVEG 30" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

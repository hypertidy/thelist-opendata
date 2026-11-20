# LIST TASWATER Ss Lateralline

LIST TASWATER Ss Lateralline: LIST product `LIST_TASWATER_SS_LATERALLINE`, statewide. 163,185 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-06-08. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER Ss Lateralline" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_ss_lateralline_statewide.parquet` | vector | 163,185 | 8.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_ss_lateralline/statewide/list_taswater_ss_lateralline_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_ss_lateralline/statewide/list_taswater_ss_lateralline_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_ss_lateralline%2Fstatewide%2Flist_taswater_ss_lateralline_statewide.parquet

## Columns

`MATERIAL` (string), `DIAMETER` (decimal), `ASSETID` (string), `D_MATERIAL` (string), `D_DIAMETER` (string), `ACCURACY` (string), `SHAPE_LEN` (decimal)

## Source

- [LIST_TASWATER_SS_LATERALLINE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_SS_LATERALLINE_STATEWIDE.zip), released 2023-06-08

## Attribution

"LIST TASWATER Ss Lateralline" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

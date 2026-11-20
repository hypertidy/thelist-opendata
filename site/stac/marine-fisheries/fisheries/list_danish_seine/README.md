# LIST Danish Seine

LIST Danish Seine: LIST product `LIST_DANISH_SEINE`, statewide. 42 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-09-02. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Danish Seine" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_danish_seine_statewide.parquet` | vector | 42 | 9.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_danish_seine/statewide/list_danish_seine_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_danish_seine/statewide/list_danish_seine_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_danish_seine%2Fstatewide%2Flist_danish_seine_statewide.parquet

## Columns

`ID` (int16), `RESTRICTION` (string), `SYMBOL_ORDER` (string), `DESCRIPTION` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_DANISH_SEINE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DANISH_SEINE_STATEWIDE.zip), released 2021-09-02

## Attribution

"LIST Danish Seine" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Electoral Divs

LIST Electoral Divs: LIST product `LIST_ELECTORAL_DIVS`, statewide. 5 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Electoral Divs" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_electoral_divs_statewide.parquet` | vector | 5 | 14.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_electoral_divs/statewide/list_electoral_divs_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_electoral_divs/statewide/list_electoral_divs_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_electoral_divs%2Fstatewide%2Flist_electoral_divs_statewide.parquet

## Columns

`ELECTOR_ID` (int32), `NAME` (string), `PLAN_REF` (string), `COMMENTS` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `NOM_REG_NO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_ELECTORAL_DIVS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_ELECTORAL_DIVS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Electoral Divs" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

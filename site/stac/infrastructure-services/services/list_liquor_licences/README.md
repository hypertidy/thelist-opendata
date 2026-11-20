# LIST Liquor Licences

LIST Liquor Licences: LIST product `LIST_LIQUOR_LICENCES`, statewide. 1,938 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-08-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Liquor Licences" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_liquor_licences_statewide.parquet` | vector | 1,938 | 121.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_liquor_licences/statewide/list_liquor_licences_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_liquor_licences/statewide/list_liquor_licences_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_liquor_licences%2Fstatewide%2Flist_liquor_licences_statewide.parquet

## Columns

`LICENCE_NO` (string), `CURRENCY` (datetime), `PREMISE_NA` (string), `PREMISE_AD` (string), `CATEGORY` (string), `SUB_CATEGO` (string), `DISCLAIMER` (string), `WEB_LINK` (string)

## Source

- [LIST_LIQUOR_LICENCES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LIQUOR_LICENCES_STATEWIDE.zip), released 2026-08-14

## Attribution

"LIST Liquor Licences" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

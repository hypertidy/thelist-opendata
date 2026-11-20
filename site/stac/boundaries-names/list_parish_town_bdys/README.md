# LIST Parish Town Bdys

LIST Parish Town Bdys: LIST product `LIST_PARISH_TOWN_BDYS`, statewide. 707 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Parish Town Bdys" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_parish_town_bdys_statewide.parquet` | vector | 707 | 4.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parish_town_bdys/statewide/list_parish_town_bdys_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_parish_town_bdys/statewide/list_parish_town_bdys_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_parish_town_bdys%2Fstatewide%2Flist_parish_town_bdys_statewide.parquet

## Columns

`PT_ID` (double), `PARISH` (string), `TOWN_CITY` (string), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_PARISH_TOWN_BDYS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PARISH_TOWN_BDYS_STATEWIDE.zip), released 2025-07-10

## Attribution

"LIST Parish Town Bdys" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

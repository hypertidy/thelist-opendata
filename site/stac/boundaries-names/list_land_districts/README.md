# LIST Land Districts

LIST Land Districts: LIST product `LIST_LAND_DISTRICTS`, statewide. 78 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Districts" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_districts_statewide.parquet` | vector | 78 | 771.1 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_districts/statewide/list_land_districts_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_districts/statewide/list_land_districts_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_districts%2Fstatewide%2Flist_land_districts_statewide.parquet

## Columns

`LD_ID` (int32), `LAND_DIST` (string), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_LAND_DISTRICTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND_DISTRICTS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Land Districts" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

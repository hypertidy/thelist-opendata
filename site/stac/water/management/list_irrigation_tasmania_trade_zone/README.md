# LIST Irrigation Tasmania Trade Zone

LIST Irrigation Tasmania Trade Zone: LIST product `LIST_IRRIGATION_TASMANIA_TRADE_ZONE`, statewide. 273 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-06-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Irrigation Tasmania Trade Zone" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_irrigation_tasmania_trade_zone_statewide.parquet` | vector | 273 | 786.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_irrigation_tasmania_trade_zone/statewide/list_irrigation_tasmania_trade_zone_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_irrigation_tasmania_trade_zone/statewide/list_irrigation_tasmania_trade_zone_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_irrigation_tasmania_trade_zone%2Fstatewide%2Flist_irrigation_tasmania_trade_zone_statewide.parquet

## Columns

`SCHEME` (string), `ZONENAME` (string), `SHAPE_Length` (double)

## Source

- [LIST_IRRIGATION_TASMANIA_TRADE_ZONE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_IRRIGATION_TASMANIA_TRADE_ZONE_STATEWIDE.zip), released 2026-06-10

## Attribution

"LIST Irrigation Tasmania Trade Zone" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

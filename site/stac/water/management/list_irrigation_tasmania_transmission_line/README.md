# LIST Irrigation Tasmania Transmission Line

LIST Irrigation Tasmania Transmission Line: LIST product `LIST_IRRIGATION_TASMANIA_TRANSMISSION_LINE`, statewide. 43 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-06-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Irrigation Tasmania Transmission Line" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_irrigation_tasmania_transmission_line_statewide.parquet` | vector | 43 | 26.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_irrigation_tasmania_transmission_line/statewide/list_irrigation_tasmania_transmission_line_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_irrigation_tasmania_transmission_line/statewide/list_irrigation_tasmania_transmission_line_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_irrigation_tasmania_transmission_line%2Fstatewide%2Flist_irrigation_tasmania_transmission_line_statewide.parquet

## Columns

`ASSETNO` (int32), `LOCATION` (string), `SCHEME` (string), `GLOBALID` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double)

## Source

- [LIST_IRRIGATION_TASMANIA_TRANSMISSION_LINE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_IRRIGATION_TASMANIA_TRANSMISSION_LINE_STATEWIDE.zip), released 2026-06-10

## Attribution

"LIST Irrigation Tasmania Transmission Line" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

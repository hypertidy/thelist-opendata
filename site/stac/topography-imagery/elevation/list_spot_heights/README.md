# LIST Spot Heights

LIST Spot Heights: LIST product `LIST_SPOT_HEIGHTS`, statewide. 178,786 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Spot Heights" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_spot_heights_statewide.parquet` | vector | 178,786 | 16.7 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_spot_heights/statewide/list_spot_heights_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_spot_heights/statewide/list_spot_heights_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_spot_heights%2Fstatewide%2Flist_spot_heights_statewide.parquet

## Columns

`SPOT_HT_ID` (int32), `SPOT_HT_TY` (int32), `SPOT_TYTXT` (string), `ELEVATION` (int32), `MAP_DEPICT` (int16), `MAP_DEPTXT` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string)

## Source

- [LIST_SPOT_HEIGHTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SPOT_HEIGHTS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Spot Heights" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

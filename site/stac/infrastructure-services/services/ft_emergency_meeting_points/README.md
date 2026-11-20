# FT Emergency Meeting Points

FT Emergency Meeting Points: LIST product `FT_EMERGENCY_MEETING_POINTS`, statewide. 271 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "FT Emergency Meeting Points" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `ft_emergency_meeting_points_statewide.parquet` | vector | 271 | 51.1 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/ft_emergency_meeting_points/statewide/ft_emergency_meeting_points_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/ft_emergency_meeting_points/statewide/ft_emergency_meeting_points_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fft_emergency_meeting_points%2Fstatewide%2Fft_emergency_meeting_points_statewide.parquet

## Columns

`EMP_NO` (double), `ASSET_ID` (double), `ASSET_NAME` (string), `ASSETLABEL` (double), `COMMENTS` (string), `LONGITUDE` (string), `LATITUDE` (string), `LOC_DESC` (string), `ASSET_TYPE` (string), `BLOCK_NAME` (string), `ASSETCLASS` (string), `ASSET_STAT` (string), `EMP_CODE_1` (string), `EMP_CODE_2` (string), `EMP_CODE_3` (string), `EASTING` (double), `NORTHING` (double), `SRCACC` (string), `SHEETNO25` (double), `SNAME25` (string), `SHEETNO100` (double), `SNAME100` (string), `SHEETNO75` (double), `SNAME75` (double), `DISTNAME` (string), `LAST_REVIE` (string), `MAINTENANC` (string), `SIGN_MAINT` (string), `GSM` (string), `NEXTG` (string), `HELI_ACCES` (string), `HELI_AUTN` (string), `FOREST_REG` (string), `OWNER` (string)

## Source

- [FT_EMERGENCY_MEETING_POINTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/FT_EMERGENCY_MEETING_POINTS_STATEWIDE.zip), released 2025-07-17

## Attribution

"FT Emergency Meeting Points" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

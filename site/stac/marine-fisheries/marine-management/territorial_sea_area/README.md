# Territorial Sea Area

Territorial Sea Area: LIST product `TERRITORIAL_SEA__AREA`, statewide. 1 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Territorial Sea Area" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `territorial_sea_area_statewide.parquet` | vector | 1 | 1.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/territorial_sea_area/statewide/territorial_sea_area_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/territorial_sea_area/statewide/territorial_sea_area_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fterritorial_sea_area%2Fstatewide%2Fterritorial_sea_area_statewide.parquet

## Columns

`UFI` (string), `CUSTOD_ID` (int32), `CREATED_ON` (string), `DELETE_FLAG` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TERRITORIAL_SEA__AREA_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TERRITORIAL_SEA__AREA_STATEWIDE.zip), released 2025-07-17

## Attribution

"Territorial Sea Area" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

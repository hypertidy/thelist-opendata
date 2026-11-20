# LIST Soil Boundaries

LIST Soil Boundaries: LIST product `LIST_SOIL_BOUNDARIES`, statewide. 6,523 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Soil Boundaries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_soil_boundaries_statewide.parquet` | vector | 6,523 | 2.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_soil_boundaries/statewide/list_soil_boundaries_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_soil_boundaries/statewide/list_soil_boundaries_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_soil_boundaries%2Fstatewide%2Flist_soil_boundaries_statewide.parquet

## Columns

`SOILBDY_ID` (double), `SOURCE_CD` (int32), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `RETIRED_ON` (string), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double)

## Source

- [LIST_SOIL_BOUNDARIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SOIL_BOUNDARIES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Soil Boundaries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

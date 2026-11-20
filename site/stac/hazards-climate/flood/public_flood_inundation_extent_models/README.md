# Public Flood Inundation Extent Models

Public Flood Inundation Extent Models: LIST product `PUBLIC_FLOOD_INUNDATION_EXTENT_MODELS`, statewide. 35 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Public Flood Inundation Extent Models" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `public_flood_inundation_extent_models_statewide.parquet` | vector | 35 | 576.4 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/public_flood_inundation_extent_models/statewide/public_flood_inundation_extent_models_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/public_flood_inundation_extent_models/statewide/public_flood_inundation_extent_models_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fpublic_flood_inundation_extent_models%2Fstatewide%2Fpublic_flood_inundation_extent_models_statewide.parquet

## Columns

`UFI` (string), `CUSTOD_ID` (int32), `RIVERBASIN` (string), `MODELLINGORG` (string), `DATASETCUSTODIAN` (string), `FEATURECLASSNAME` (string), `CREATED_ON` (string), `DELETE_FLAG` (string), `FLOODSCENARIO` (string), `STUDYDATE` (string), `DAM_ID` (int16), `STUDYURL` (string), `DAM_NAME` (string), `SIMPLESCENARIO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [PUBLIC_FLOOD_INUNDATION_EXTENT_MODELS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/PUBLIC_FLOOD_INUNDATION_EXTENT_MODELS_STATEWIDE.zip), released 2025-07-17

## Attribution

"Public Flood Inundation Extent Models" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

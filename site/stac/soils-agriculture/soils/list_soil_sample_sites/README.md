# LIST Soil Sample Sites

LIST Soil Sample Sites: LIST product `LIST_SOIL_SAMPLE_SITES`, statewide. 181 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Soil Sample Sites" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_soil_sample_sites_statewide.parquet` | vector | 181 | 26.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_soil_sample_sites/statewide/list_soil_sample_sites_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_soil_sample_sites/statewide/list_soil_sample_sites_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_soil_sample_sites%2Fstatewide%2Flist_soil_sample_sites_statewide.parquet

## Columns

`SOILSAM_ID` (double), `SOILSAM_CD` (string), `EASTING` (double), `NORTHING` (double), `SLSAM_DESC` (string), `SLSAM_PHOT` (string), `SLSAM_USE` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `RETIRED_ON` (string), `SHAPE_FID` (int32), `LIST_GUID` (string)

## Source

- [LIST_SOIL_SAMPLE_SITES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SOIL_SAMPLE_SITES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Soil Sample Sites" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

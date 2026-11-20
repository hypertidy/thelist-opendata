# Giant Kelp Aerial Survey 2019

Giant Kelp Aerial Survey 2019: LIST product `GIANT_KELP_AERIAL_SURVEY_2019`, statewide. 186 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Giant Kelp Aerial Survey 2019" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `giant_kelp_aerial_survey_2019_statewide.parquet` | vector | 186 | 137.0 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/giant_kelp_aerial_survey_2019/statewide/giant_kelp_aerial_survey_2019_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/giant_kelp_aerial_survey_2019/statewide/giant_kelp_aerial_survey_2019_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fgiant_kelp_aerial_survey_2019%2Fstatewide%2Fgiant_kelp_aerial_survey_2019_statewide.parquet

## Columns

`ID` (int32), `LOCATION` (string), `DENSITY` (string), `RELIABILIT` (string), `IMCRA_MESO` (string), `AREA_M2` (double), `REGION` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [GIANT_KELP_AERIAL_SURVEY_2019_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/GIANT_KELP_AERIAL_SURVEY_2019_STATEWIDE.zip), released 2020-06-04

## Attribution

"Giant Kelp Aerial Survey 2019" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

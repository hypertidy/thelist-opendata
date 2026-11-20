# LIST Coastal Inundation Hazard Bands 20161201

LIST Coastal Inundation Hazard Bands 20161201: LIST product `LIST_COASTAL_INUNDATION_HAZARD_BANDS_20161201`, statewide. 160,963 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-10-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Coastal Inundation Hazard Bands 20161201" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_coastal_inundation_hazard_bands_20161201_statewide.parquet` | vector | 160,963 | 79.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_inundation_hazard_bands_20161201/statewide/list_coastal_inundation_hazard_bands_20161201_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_inundation_hazard_bands_20161201/statewide/list_coastal_inundation_hazard_bands_20161201_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_coastal_inundation_hazard_bands_20161201%2Fstatewide%2Flist_coastal_inundation_hazard_bands_20161201_statewide.parquet

## Columns

`DISCLAIMER` (string), `HAZARD_BAND` (string), `HAZARD_EXPOSURE` (string), `INLAND_FLOOD_RISK` (string), `HEIGHT_HIGH` (double), `HEIGHT_MEDIUM` (double), `HEIGHT_LOW` (double), `LL_POS_EN` (string), `EASTING` (double), `NORTHING` (double), `BASE_HT` (double), `BASE_HT_REF` (string), `HAT` (double), `LOCAL_STORM_SURGE` (string), `WAVE_SETUP` (string), `WAVE_RUNUP` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_COASTAL_INUNDATION_HAZARD_BANDS_20161201_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COASTAL_INUNDATION_HAZARD_BANDS_20161201_STATEWIDE.zip), released 2019-10-16

## Attribution

"LIST Coastal Inundation Hazard Bands 20161201" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

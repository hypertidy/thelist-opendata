# LIST Coastal Projected Storm Tide 20161201 1PCT AEP 2010

LIST Coastal Projected Storm Tide 20161201 1PCT AEP 2010: LIST product `LIST_COASTAL_PROJECTED_STORM_TIDE_20161201_1PCT_AEP_2010`, statewide. 64,387 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-10-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Coastal Projected Storm Tide 20161201 1PCT AEP 2010" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_coastal_projected_storm_tide_20161201_1pct_aep_2010_statewide.parquet` | vector | 64,387 | 29.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_projected_storm_tide_20161201_1pct_aep_2010/statewide/list_coastal_projected_storm_tide_20161201_1pct_aep_2010_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_projected_storm_tide_20161201_1pct_aep_2010/statewide/list_coastal_projected_storm_tide_20161201_1pct_aep_2010_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_coastal_projected_storm_tide_20161201_1pct_aep_2010%2Fstatewide%2Flist_coastal_projected_storm_tide_20161201_1pct_aep_2010_statewide.parquet

## Columns

`IC1PCT_RU` (int16), `SLR` (string), `DEM_REF` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_COASTAL_PROJECTED_STORM_TIDE_20161201_1PCT_AEP_2010_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COASTAL_PROJECTED_STORM_TIDE_20161201_1PCT_AEP_2010_STATEWIDE.zip), released 2019-10-16

## Attribution

"LIST Coastal Projected Storm Tide 20161201 1PCT AEP 2010" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

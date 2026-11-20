# LIST Coastal Projected Sea Level Rise 20161201

LIST Coastal Projected Sea Level Rise 20161201: LIST product `LIST_COASTAL_PROJECTED_SEA_LEVEL_RISE_20161201`, statewide. 465,758 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2024-09-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Coastal Projected Sea Level Rise 20161201" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_coastal_projected_sea_level_rise_20161201_statewide.parquet` | vector | 465,758 | 59.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_projected_sea_level_rise_20161201/statewide/list_coastal_projected_sea_level_rise_20161201_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastal_projected_sea_level_rise_20161201/statewide/list_coastal_projected_sea_level_rise_20161201_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_coastal_projected_sea_level_rise_20161201%2Fstatewide%2Flist_coastal_projected_sea_level_rise_20161201_statewide.parquet

## Columns

`TR2050_RU` (string), `TR2100_RU` (string), `IC2050_RU` (int16), `IC2100_RU` (int16), `SL_REF` (string), `TR_LEV_RU` (string), `DEM_REF` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_COASTAL_PROJECTED_SEA_LEVEL_RISE_20161201_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COASTAL_PROJECTED_SEA_LEVEL_RISE_20161201_STATEWIDE.zip), released 2024-09-24

## Attribution

"LIST Coastal Projected Sea Level Rise 20161201" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

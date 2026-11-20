# LIST TASWATER Water Serviced Land

LIST TASWATER Water Serviced Land: LIST product `LIST_TASWATER_WATER_SERVICED_LAND`, statewide. 12,698 features, multi-polygon (EPSG:28355+5711). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASWATER Water Serviced Land" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_taswater_water_serviced_land_statewide.parquet` | vector | 12,698 | 7.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_water_serviced_land/statewide/list_taswater_water_serviced_land_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_taswater_water_serviced_land/statewide/list_taswater_water_serviced_land_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_taswater_water_serviced_land%2Fstatewide%2Flist_taswater_water_serviced_land_statewide.parquet

## Columns

`SERVICETYPE` (string), `DESCRIPTION` (string), `DATEOFISSUE` (datetime), `DISCLAIMER` (string), `PHONE` (string), `EMAIL` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASWATER_WATER_SERVICED_LAND_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASWATER_WATER_SERVICED_LAND_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST TASWATER Water Serviced Land" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

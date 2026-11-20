# DHHS Ambulance Stations

DHHS Ambulance Stations: LIST product `DHHS_AMBULANCE_STATIONS`, statewide. 45 features, multi-point z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2016-07-28. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "DHHS Ambulance Stations" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `dhhs_ambulance_stations_statewide.parquet` | vector | 45 | 15.8 KB |
| `dhhs_ambulance_stations.parquet` | vector | 45 | 15.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/dhhs_ambulance_stations/statewide/dhhs_ambulance_stations_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/dhhs_ambulance_stations/statewide/dhhs_ambulance_stations_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fdhhs_ambulance_stations%2Fstatewide%2Fdhhs_ambulance_stations_statewide.parquet

## Columns

`OBJECTID` (int64), `ID` (int64), `NAME` (string), `MAJOR_CATE` (string), `MINOR_CATE` (string), `PROP_ADD` (string), `SUBURB` (string), `MUNICIPALI` (string), `EASTING_GD` (int64), `NORTHING_G` (int64)

## Source

- [DHHS_AMBULANCE_STATIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/DHHS_AMBULANCE_STATIONS_STATEWIDE.zip), released 2016-07-28

## Attribution

"DHHS Ambulance Stations" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

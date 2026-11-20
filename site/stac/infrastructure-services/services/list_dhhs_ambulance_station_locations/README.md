# LIST DHHS Ambulance Station Locations

LIST DHHS Ambulance Station Locations: LIST product `LIST_DHHS_AMBULANCE_STATION_LOCATIONS`, statewide. 203 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2017-06-29. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST DHHS Ambulance Station Locations" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_dhhs_ambulance_station_locations_statewide.parquet` | vector | 203 | 25.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_dhhs_ambulance_station_locations/statewide/list_dhhs_ambulance_station_locations_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_dhhs_ambulance_station_locations/statewide/list_dhhs_ambulance_station_locations_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_dhhs_ambulance_station_locations%2Fstatewide%2Flist_dhhs_ambulance_station_locations_statewide.parquet

## Columns

`ID` (int32), `NAME` (string), `MAJOR_CATEGORY` (string), `MINOR_CATEGORY` (string), `PROP_ADD` (string), `SUBURB` (string), `MUNICIPALITY` (string), `EASTING_GDA` (int32), `NORTHING_GDA` (int32)

## Source

- [LIST_DHHS_AMBULANCE_STATION_LOCATIONS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DHHS_AMBULANCE_STATION_LOCATIONS_STATEWIDE.zip), released 2017-06-29

## Attribution

"LIST DHHS Ambulance Station Locations" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

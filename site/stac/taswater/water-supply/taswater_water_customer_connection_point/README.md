# TASWATER Water Customer Connection Point

TASWATER Water Customer Connection Point: LIST product `TASWATER_WATER_CUSTOMER_CONNECTION_POINT`, statewide. 223,755 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TASWATER Water Customer Connection Point" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `taswater_water_customer_connection_point_statewide.parquet` | vector | 223,755 | 15.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/taswater_water_customer_connection_point/statewide/taswater_water_customer_connection_point_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/taswater_water_customer_connection_point/statewide/taswater_water_customer_connection_point_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftaswater_water_customer_connection_point%2Fstatewide%2Ftaswater_water_customer_connection_point_statewide.parquet

## Columns

`CRC_ID` (string), `DIAMETER` (double), `MXLOCATION` (string), `D_DIAMETER` (string), `LIST_GUID` (string)

## Source

- [TASWATER_WATER_CUSTOMER_CONNECTION_POINT_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASWATER_WATER_CUSTOMER_CONNECTION_POINT_STATEWIDE.zip), released 2025-07-17

## Attribution

"TASWATER Water Customer Connection Point" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

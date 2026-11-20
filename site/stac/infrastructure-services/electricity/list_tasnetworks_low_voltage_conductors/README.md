# LIST Tasnetworks Low Voltage Conductors

LIST Tasnetworks Low Voltage Conductors: LIST product `LIST_TASNETWORKS_LOW_VOLTAGE_CONDUCTORS`, statewide. 360,513 features, multi-linestring z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Tasnetworks Low Voltage Conductors" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasnetworks_low_voltage_conductors_statewide.parquet` | vector | 360,513 | 16.7 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_low_voltage_conductors/statewide/list_tasnetworks_low_voltage_conductors_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasnetworks_low_voltage_conductors/statewide/list_tasnetworks_low_voltage_conductors_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasnetworks_low_voltage_conductors%2Fstatewide%2Flist_tasnetworks_low_voltage_conductors_statewide.parquet

## Columns

`FEATURE_TYPE` (string), `SHAPE_Length` (double)

## Source

- [LIST_TASNETWORKS_LOW_VOLTAGE_CONDUCTORS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASNETWORKS_LOW_VOLTAGE_CONDUCTORS_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Tasnetworks Low Voltage Conductors" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

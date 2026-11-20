# EPA Sewage Discharge Vessels Carrying 16 Or More People

EPA Sewage Discharge Vessels Carrying 16 Or More People: LIST product `EPA_SEWAGE_DISCHARGE_VESSELS_CARRYING_16_OR_MORE_PEOPLE`, statewide. 1 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "EPA Sewage Discharge Vessels Carrying 16 Or More People" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `epa_sewage_discharge_vessels_carrying_16_or_more_people_statewide.parquet` | vector | 1 | 744.1 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_sewage_discharge_vessels_carrying_16_or_more_people/statewide/epa_sewage_discharge_vessels_carrying_16_or_more_people_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_sewage_discharge_vessels_carrying_16_or_more_people/statewide/epa_sewage_discharge_vessels_carrying_16_or_more_people_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fepa_sewage_discharge_vessels_carrying_16_or_more_people%2Fstatewide%2Fepa_sewage_discharge_vessels_carrying_16_or_more_people_statewide.parquet

## Columns

`DIRECTIVE` (string), `DESCRIPTOR` (string), `PART1` (string), `PART` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [EPA_SEWAGE_DISCHARGE_VESSELS_CARRYING_16_OR_MORE_PEOPLE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/EPA_SEWAGE_DISCHARGE_VESSELS_CARRYING_16_OR_MORE_PEOPLE_STATEWIDE.zip), released 2025-07-17

## Attribution

"EPA Sewage Discharge Vessels Carrying 16 Or More People" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# EPA Disinfected Sewage Discharge Vessels Carrying Less Than 16 People

EPA Disinfected Sewage Discharge Vessels Carrying Less Than 16 People: LIST product `EPA_DISINFECTED_SEWAGE_DISCHARGE_VESSELS_CARRYING_LESS_THAN_16_PEOPLE`, statewide. 500 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "EPA Disinfected Sewage Discharge Vessels Carrying Less Than 16 People" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `epa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people_statewide.parquet` | vector | 500 | 6.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people/statewide/epa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people/statewide/epa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fepa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people%2Fstatewide%2Fepa_disinfected_sewage_discharge_vessels_carrying_less_than_16_people_statewide.parquet

## Columns

`DIRECTIVE` (string), `DESCRIPTOR` (string), `PART1` (string), `PART` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [EPA_DISINFECTED_SEWAGE_DISCHARGE_VESSELS_CARRYING_LESS_THAN_16_PEOPLE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/EPA_DISINFECTED_SEWAGE_DISCHARGE_VESSELS_CARRYING_LESS_THAN_16_PEOPLE_STATEWIDE.zip), released 2025-07-17

## Attribution

"EPA Disinfected Sewage Discharge Vessels Carrying Less Than 16 People" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

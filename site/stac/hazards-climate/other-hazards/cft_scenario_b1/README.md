# CFT Scenario B1

CFT Scenario B1: LIST product `CFT_SCENARIO_B1`, statewide. 721 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "CFT Scenario B1" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `cft_scenario_b1_statewide.parquet` | vector | 721 | 147.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/cft_scenario_b1/statewide/cft_scenario_b1_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/cft_scenario_b1/statewide/cft_scenario_b1_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fcft_scenario_b1%2Fstatewide%2Fcft_scenario_b1_statewide.parquet

## Columns

`ID` (int32), `PE_B1_1` (double), `PE_B1_2` (double), `PE_B1_3` (double), `RF_B1_1` (double), `RF_B1_2` (double), `RF_B1_3` (double), `RH_B1_1` (double), `RH_B1_2` (double), `RH_B1_3` (double), `TM_B1_1` (double), `TM_B1_2` (double), `TM_B1_3` (double), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [CFT_SCENARIO_B1_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/CFT_SCENARIO_B1_STATEWIDE.zip), released 2025-07-17

## Attribution

"CFT Scenario B1" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

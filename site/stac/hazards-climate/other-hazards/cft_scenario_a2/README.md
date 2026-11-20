# CFT Scenario A2

CFT Scenario A2: LIST product `CFT_SCENARIO_A2`, statewide. 721 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "CFT Scenario A2" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `cft_scenario_a2_statewide.parquet` | vector | 721 | 167.6 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/cft_scenario_a2/statewide/cft_scenario_a2_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/cft_scenario_a2/statewide/cft_scenario_a2_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fcft_scenario_a2%2Fstatewide%2Fcft_scenario_a2_statewide.parquet

## Columns

`ID` (int32), `PE_A2_1` (double), `PE_A2_2` (double), `PE_A2_3` (double), `RF_A2_1` (double), `RF_A2_2` (double), `RF_A2_3` (double), `RH_A2_1` (double), `RH_A2_2` (double), `RH_A2_3` (double), `TM_A2_1` (double), `TM_A2_2` (double), `TM_A2_3` (double), `FROM_A2_0` (double), `FROM_A2_1` (double), `FROM_A2_2` (double), `FROM_A2_3` (double), `SPIM_A2_1` (double), `SPIM_A2_2` (double), `SPIM_A2_3` (double), `SPIC_A2_1` (double), `SPIC_A2_2` (double), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [CFT_SCENARIO_A2_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/CFT_SCENARIO_A2_STATEWIDE.zip), released 2025-07-17

## Attribution

"CFT Scenario A2" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

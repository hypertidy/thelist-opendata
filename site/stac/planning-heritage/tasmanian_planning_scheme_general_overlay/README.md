# Tasmanian Planning Scheme General Overlay

Tasmanian Planning Scheme General Overlay: LIST product `TASMANIAN_PLANNING_SCHEME_GENERAL_OVERLAY`, statewide. 942 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-08-20. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Tasmanian Planning Scheme General Overlay" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tasmanian_planning_scheme_general_overlay_statewide.parquet` | vector | 942 | 25.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmanian_planning_scheme_general_overlay/statewide/tasmanian_planning_scheme_general_overlay_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/tasmanian_planning_scheme_general_overlay/statewide/tasmanian_planning_scheme_general_overlay_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Ftasmanian_planning_scheme_general_overlay%2Fstatewide%2Ftasmanian_planning_scheme_general_overlay_statewide.parquet

## Columns

`LPS_NO` (int16), `LPS` (string), `OV_TYPENO` (int16), `OV_TYPE` (string), `OV_ABB` (string), `OV_NAME` (string), `OV_CAT` (string), `DESCRIPT` (string), `LPS_REF` (string), `LPSDATE` (datetime), `AMEND_REF` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [TASMANIAN_PLANNING_SCHEME_GENERAL_OVERLAY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TASMANIAN_PLANNING_SCHEME_GENERAL_OVERLAY_STATEWIDE.zip), released 2026-08-20

## Attribution

"Tasmanian Planning Scheme General Overlay" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

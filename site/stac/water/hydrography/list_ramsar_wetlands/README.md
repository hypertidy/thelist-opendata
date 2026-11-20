# LIST Ramsar Wetlands

LIST Ramsar Wetlands: LIST product `LIST_RAMSAR_WETLANDS`, statewide. 10 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Ramsar Wetlands" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_ramsar_wetlands_statewide.parquet` | vector | 10 | 255.4 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_ramsar_wetlands/statewide/list_ramsar_wetlands_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_ramsar_wetlands/statewide/list_ramsar_wetlands_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_ramsar_wetlands%2Fstatewide%2Flist_ramsar_wetlands_statewide.parquet

## Columns

`CID` (int32), `CATEGORY` (string), `NAME` (string), `REFCODE3` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `PLAN_REF` (string), `PLAN_AUTH` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `NOM_REG_NO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_RAMSAR_WETLANDS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_RAMSAR_WETLANDS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Ramsar Wetlands" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

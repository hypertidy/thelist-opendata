# Built Infrastructure Point

Built Infrastructure Point: LIST product `BUILT_INFRASTRUCTURE_POINT`, statewide. 10,928 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Built Infrastructure Point" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `built_infrastructure_point_statewide.parquet` | vector | 10,928 | 917.2 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/built_infrastructure_point/statewide/built_infrastructure_point_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/built_infrastructure_point/statewide/built_infrastructure_point_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fbuilt_infrastructure_point%2Fstatewide%2Fbuilt_infrastructure_point_statewide.parquet

## Columns

`INFRA_ID` (int32), `INFRA_TY1` (int32), `INFRA_TY2` (int32), `INFTY1_TXT` (string), `INFTY2_TXT` (string), `NOM_REG_NO` (string), `NAME` (string), `DESCRIPT` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string)

## Source

- [BUILT_INFRASTRUCTURE_POINT_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/BUILT_INFRASTRUCTURE_POINT_STATEWIDE.zip), released 2025-07-18

## Attribution

"Built Infrastructure Point" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

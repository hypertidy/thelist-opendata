# Built Infrastructure Poly

Built Infrastructure Poly: LIST product `BUILT_INFRASTRUCTURE_POLY`, statewide. 6,172 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Built Infrastructure Poly" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `built_infrastructure_poly_statewide.parquet` | vector | 6,172 | 2.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/built_infrastructure_poly/statewide/built_infrastructure_poly_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/built_infrastructure_poly/statewide/built_infrastructure_poly_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fbuilt_infrastructure_poly%2Fstatewide%2Fbuilt_infrastructure_poly_statewide.parquet

## Columns

`INFRA_ID` (int32), `INFRA_TY1` (int32), `INFRA_TY2` (int32), `INFTY1_TXT` (string), `INFTY2_TXT` (string), `NOM_REG_NO` (string), `NAME` (string), `DESCRIPT` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [BUILT_INFRASTRUCTURE_POLY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/BUILT_INFRASTRUCTURE_POLY_STATEWIDE.zip), released 2025-07-18

## Attribution

"Built Infrastructure Poly" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

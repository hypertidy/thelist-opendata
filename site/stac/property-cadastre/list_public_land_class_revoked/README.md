# LIST Public Land Class Revoked

LIST Public Land Class Revoked: LIST product `LIST_PUBLIC_LAND_CLASS_REVOKED`, statewide. 1,215 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Public Land Class Revoked" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_public_land_class_revoked_statewide.parquet` | vector | 1,215 | 1.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_public_land_class_revoked/statewide/list_public_land_class_revoked_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_public_land_class_revoked/statewide/list_public_land_class_revoked_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_public_land_class_revoked%2Fstatewide%2Flist_public_land_class_revoked_statewide.parquet

## Columns

`CID` (int32), `CATEGORY` (string), `NAME` (string), `STATUS` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `PLAN_REF` (string), `PLAN_AUTH` (string), `INST_TYPE` (string), `INST_NO` (string), `GOVERN_ACT` (string), `GAZ_DATE` (string), `EFFEC_DATE` (string), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_PUBLIC_LAND_CLASS_REVOKED_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_PUBLIC_LAND_CLASS_REVOKED_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Public Land Class Revoked" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Fmac Boundaries

LIST Fmac Boundaries: LIST product `LIST_FMAC_BOUNDARIES`, statewide. 10 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-09-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Fmac Boundaries" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_fmac_boundaries_statewide.parquet` | vector | 10 | 4.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_fmac_boundaries/statewide/list_fmac_boundaries_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_fmac_boundaries/statewide/list_fmac_boundaries_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_fmac_boundaries%2Fstatewide%2Flist_fmac_boundaries_statewide.parquet

## Columns

`UFI` (string), `CREATED_ON` (string), `NOM_REG_NO` (string), `NAME` (string), `PLAN_NO` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_FMAC_BOUNDARIES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_FMAC_BOUNDARIES_STATEWIDE.zip), released 2026-09-04

## Attribution

"LIST Fmac Boundaries" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

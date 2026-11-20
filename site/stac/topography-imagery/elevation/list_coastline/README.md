# LIST Coastline

LIST Coastline: LIST product `LIST_COASTLINE`, statewide. 173,058 features, multi-linestring (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Coastline" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_coastline_statewide.parquet` | vector | 173,058 | 47.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastline/statewide/list_coastline_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_coastline/statewide/list_coastline_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_coastline%2Fstatewide%2Flist_coastline_statewide.parquet

## Columns

`HYDLINE_ID` (double), `HYDLNTY1` (string), `HYDLNTY2` (string), `NAME` (string), `NOM_REG_NO` (string), `MHWM_TYPE` (string), `HYD_CLASS` (string), `EXISTING` (string), `RELGRND` (string), `INUSE` (string), `HYDCNTR_TY` (string), `ADJ_FEAT_1` (string), `ADJ_FEAT_2` (string), `HEIGHT` (double), `COMP_LEN` (double), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double)

## Source

- [LIST_COASTLINE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_COASTLINE_STATEWIDE.zip), released 2025-07-09

## Attribution

"LIST Coastline" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

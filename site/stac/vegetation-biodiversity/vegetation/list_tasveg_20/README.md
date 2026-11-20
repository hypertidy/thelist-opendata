# LIST TASVEG 20

LIST TASVEG 20: LIST product `LIST_TASVEG_20`, statewide. 403,629 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Note: CRS missing from the file (GeoParquet readers will assume lon/lat); the coordinates are MGA zone 55 (EPSG:28355). Source released 2018-01-19. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 20" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasveg_20_statewide.parquet` | vector | 403,629 | 277.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_20/statewide/list_tasveg_20_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_20/statewide/list_tasveg_20_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_20%2Fstatewide%2Flist_tasveg_20_statewide.parquet

## Columns

`OBJECTID` (int32), `VEGCODE` (string), `CANOPY` (string), `COMP_AREA` (double), `IMAGE_DATE` (string), `IMAGE_TYPE` (string), `IMAGE_SCAL` (int32), `IMAGE_COL` (string), `REL_FIELD` (int16), `REL_VEGMA` (int16), `REL_POINT` (int16), `REL_FORPI` (int16), `REL_RFAFI` (int16), `REL_VEGEX` (int16), `REL_ECOLO` (int16), `REL_RFAIN` (int16), `REL_GUESS` (int16), `REL_RFAFO` (int16), `MAP_DATE` (datetime), `VEG_ID` (int32), `RFA_EQUIV` (string), `FIELD_DATE` (datetime), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASVEG_20_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_20_STATEWIDE.zip), released 2018-01-19

## Attribution

"LIST TASVEG 20" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

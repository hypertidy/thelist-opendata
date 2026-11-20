# LIST Reconnaissance Soils Map Extents 100K

LIST Reconnaissance Soils Map Extents 100K: LIST product `LIST_RECONNAISSANCE_SOILS_MAP_EXTENTS_100K`, statewide. 67 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-01-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Reconnaissance Soils Map Extents 100K" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_reconnaissance_soils_map_extents_100k_statewide.parquet` | vector | 67 | 345.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_reconnaissance_soils_map_extents_100k/statewide/list_reconnaissance_soils_map_extents_100k_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_reconnaissance_soils_map_extents_100k/statewide/list_reconnaissance_soils_map_extents_100k_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_reconnaissance_soils_map_extents_100k%2Fstatewide%2Flist_reconnaissance_soils_map_extents_100k_statewide.parquet

## Columns

`SOIL_MAP` (string), `SCALE` (int32), `EDITION` (int32), `PROD_YEAR` (int32), `REF` (string), `MINOR_SOIL` (string), `HOR_DATUM` (string), `VER_DATUM` (string), `MAP_PROJ` (int32), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `RETIRED_ON` (string), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_RECONNAISSANCE_SOILS_MAP_EXTENTS_100K_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_RECONNAISSANCE_SOILS_MAP_EXTENTS_100K_STATEWIDE.zip), released 2018-01-16

## Attribution

"LIST Reconnaissance Soils Map Extents 100K" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Marine Farming Zones

LIST Marine Farming Zones: LIST product `LIST_MARINE_FARMING_ZONES`, statewide. 200 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-01-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Marine Farming Zones" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_marine_farming_zones_statewide.parquet` | vector | 200 | 62.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_farming_zones/statewide/list_marine_farming_zones_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_farming_zones/statewide/list_marine_farming_zones_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_marine_farming_zones%2Fstatewide%2Flist_marine_farming_zones_statewide.parquet

## Columns

`ID` (string), `ZONE_AREA` (double), `MLA` (double), `MFDP` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_MARINE_FARMING_ZONES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_MARINE_FARMING_ZONES_STATEWIDE.zip), released 2019-01-10

## Attribution

"LIST Marine Farming Zones" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

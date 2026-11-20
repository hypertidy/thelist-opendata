# Recreational Fishing Abalone Zones

Recreational Fishing Abalone Zones: LIST product `RECREATIONAL_FISHING_ABALONE_ZONES`, statewide. 8 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-08-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Recreational Fishing Abalone Zones" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `recreational_fishing_abalone_zones_statewide.parquet` | vector | 8 | 1.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/recreational_fishing_abalone_zones/statewide/recreational_fishing_abalone_zones_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/recreational_fishing_abalone_zones/statewide/recreational_fishing_abalone_zones_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Frecreational_fishing_abalone_zones%2Fstatewide%2Frecreational_fishing_abalone_zones_statewide.parquet

## Columns

`ID` (double), `AREA_NAME` (string), `DESCRIPTION` (string), `GREENLIP_ABALONE_132MM` (string), `GREENLIP_ABALONE_145MM` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [RECREATIONAL_FISHING_ABALONE_ZONES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/RECREATIONAL_FISHING_ABALONE_ZONES_STATEWIDE.zip), released 2025-08-14

## Attribution

"Recreational Fishing Abalone Zones" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

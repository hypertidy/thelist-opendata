# LIDAR Index Coal Mines Port Arthur

LIDAR Index Coal Mines Port Arthur: LIST product `LIDAR_INDEX_COAL_MINES_PORT_ARTHUR`, statewide. 22 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIDAR Index Coal Mines Port Arthur" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `lidar_index_coal_mines_port_arthur_statewide.parquet` | vector | 22 | 11.2 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_coal_mines_port_arthur/statewide/lidar_index_coal_mines_port_arthur_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/lidar_index_coal_mines_port_arthur/statewide/lidar_index_coal_mines_port_arthur_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flidar_index_coal_mines_port_arthur%2Fstatewide%2Flidar_index_coal_mines_port_arthur_statewide.parquet

## Columns

`TILE_NUM` (string), `TILE_NAME` (string), `XMIN` (double), `YMIN` (double), `XMAX` (double), `YMAX` (double), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIDAR_INDEX_COAL_MINES_PORT_ARTHUR_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIDAR_INDEX_COAL_MINES_PORT_ARTHUR_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIDAR Index Coal Mines Port Arthur" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

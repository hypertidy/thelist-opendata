# NCH OSM Depth

NCH OSM Depth: LIST product `NCH_OSM_DEPTH`, statewide. Float32 grid, 30 x 30 cells, EPSG:32755. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-10-03. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH OSM Depth" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `osm_depth.tif` | raster | 17,321 x 18,763 px | 72.3 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_osm_depth/statewide/osm_depth.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_osm_depth/statewide/osm_depth.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_osm_depth%2Fstatewide%2Fosm_depth.tif

## Source

- [NCH_OSM_DEPTH_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_OSM_DEPTH_STATEWIDE.zip), released 2023-10-03

## Attribution

"NCH OSM Depth" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

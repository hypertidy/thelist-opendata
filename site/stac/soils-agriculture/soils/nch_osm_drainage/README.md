# NCH OSM Drainage

NCH OSM Drainage: LIST product `NCH_OSM_DRAINAGE`, statewide. Float32 grid, 30 x 30 cells, EPSG:32755. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-10-03. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH OSM Drainage" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `osm_drainage.tif` | raster | 17,321 x 18,763 px | 60.2 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_osm_drainage/statewide/osm_drainage.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_osm_drainage/statewide/osm_drainage.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_osm_drainage%2Fstatewide%2Fosm_drainage.tif

## Source

- [NCH_OSM_DRAINAGE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_OSM_DRAINAGE_STATEWIDE.zip), released 2023-10-03

## Attribution

"NCH OSM Drainage" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

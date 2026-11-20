# NCH Organic Soil Map

NCH Organic Soil Map: LIST product `NCH_ORGANIC_SOIL_MAP`, statewide. Float32 grid, 30 x 30 cells, EPSG:32755. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-10-03. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH Organic Soil Map" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `organic_soil_map.tif` | raster | 17,321 x 18,763 px | 70.3 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_organic_soil_map/statewide/organic_soil_map.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_organic_soil_map/statewide/organic_soil_map.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_organic_soil_map%2Fstatewide%2Forganic_soil_map.tif

## Source

- [NCH_ORGANIC_SOIL_MAP_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ORGANIC_SOIL_MAP_STATEWIDE.zip), released 2023-10-03

## Attribution

"NCH Organic Soil Map" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

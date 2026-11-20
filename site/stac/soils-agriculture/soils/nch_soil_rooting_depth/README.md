# NCH Soil Rooting Depth

NCH Soil Rooting Depth: LIST product `NCH_SOIL_ROOTING_DEPTH`, statewide. Float64 grid, 30 x 30 cells, EPSG:28355. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-07-08. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH Soil Rooting Depth" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_soil_rooting_depth.tif` | raster | 18,123 x 18,804 px | 260.8 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_soil_rooting_depth/statewide/nch_soil_rooting_depth.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_soil_rooting_depth/statewide/nch_soil_rooting_depth.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_soil_rooting_depth%2Fstatewide%2Fnch_soil_rooting_depth.tif

## Source

- [NCH_SOIL_ROOTING_DEPTH_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_SOIL_ROOTING_DEPTH_STATEWIDE.zip), released 2020-07-08

## Attribution

"NCH Soil Rooting Depth" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

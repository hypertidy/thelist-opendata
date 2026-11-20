# TAS Landsat Mosaic 2014 2015

TAS Landsat Mosaic 2014 2015: LIST product `TAS_LANDSAT_MOSAIC_2014_2015`, statewide. Byte grid, 30 x 30 cells, EPSG:28355. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2017-11-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TAS Landsat Mosaic 2014 2015" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tas_landsat_mosaic_1415_mga55.tif` | raster | 13,532 x 17,468 px | 398.2 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/tas_landsat_mosaic_2014_2015/statewide/tas_landsat_mosaic_1415_mga55.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/tas_landsat_mosaic_2014_2015/statewide/tas_landsat_mosaic_1415_mga55.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Ftas_landsat_mosaic_2014_2015%2Fstatewide%2Ftas_landsat_mosaic_1415_mga55.tif

## Source

- [TAS_LANDSAT_MOSAIC_2014_2015_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TAS_LANDSAT_MOSAIC_2014_2015_STATEWIDE.zip), released 2017-11-09

## Attribution

"TAS Landsat Mosaic 2014 2015" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

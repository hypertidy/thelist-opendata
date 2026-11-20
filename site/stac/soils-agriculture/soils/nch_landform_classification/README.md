# NCH Landform Classification

NCH Landform Classification: LIST product `NCH_LANDFORM_CLASSIFICATION`, statewide. Int8 grid, 30 x 30 cells, EPSG:28355. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2018-03-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH Landform Classification" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_landform_classification.tif` | raster | 18,731 x 19,320 px | 17.9 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_landform_classification/statewide/nch_landform_classification.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_landform_classification/statewide/nch_landform_classification.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_landform_classification%2Fstatewide%2Fnch_landform_classification.tif

## Source

- [NCH_LANDFORM_CLASSIFICATION_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_LANDFORM_CLASSIFICATION_STATEWIDE.zip), released 2018-03-14

## Attribution

"NCH Landform Classification" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

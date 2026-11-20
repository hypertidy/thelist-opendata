# NCH ES Hillslope Erosivity

NCH ES Hillslope Erosivity: LIST product `NCH_ES_HILLSLOPE_EROSIVITY`, statewide. Float32 grid, 30 x 30 cells, EPSG:28355. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Hillslope Erosivity" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_hillslope_erosivity.tif` | raster | 18,731 x 19,320 px | 206.5 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_es_hillslope_erosivity/statewide/nch_es_hillslope_erosivity.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_es_hillslope_erosivity/statewide/nch_es_hillslope_erosivity.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_es_hillslope_erosivity%2Fstatewide%2Fnch_es_hillslope_erosivity.tif

## Source

- [NCH_ES_HILLSLOPE_EROSIVITY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_HILLSLOPE_EROSIVITY_STATEWIDE.zip), released 2020-06-24

## Attribution

"NCH ES Hillslope Erosivity" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

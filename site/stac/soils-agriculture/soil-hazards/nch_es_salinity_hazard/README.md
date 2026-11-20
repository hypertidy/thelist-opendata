# NCH ES Salinity Hazard

NCH ES Salinity Hazard: LIST product `NCH_ES_SALINITY_HAZARD`, statewide. Float32 grid, 30 x 30 cells, EPSG:28355. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-06-24. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH ES Salinity Hazard" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `nch_es_salinity_hazard.tif` | raster | 18,731 x 19,320 px | 26.6 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/nch_es_salinity_hazard/statewide/nch_es_salinity_hazard.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/nch_es_salinity_hazard/statewide/nch_es_salinity_hazard.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Fnch_es_salinity_hazard%2Fstatewide%2Fnch_es_salinity_hazard.tif

## Source

- [NCH_ES_SALINITY_HAZARD_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_ES_SALINITY_HAZARD_STATEWIDE.zip), released 2020-06-24

## Attribution

"NCH ES Salinity Hazard" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

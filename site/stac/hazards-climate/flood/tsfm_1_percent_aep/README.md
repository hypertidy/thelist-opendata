# TSFM 1 Percent AEP

TSFM 1 Percent AEP: LIST product `TSFM_1_PERCENT_AEP`, statewide. Float32 grid, 10 x 10 cells, EPSG:28355; 8 grids. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-02-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TSFM 1 Percent AEP" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `dr_peak_flood_depth_1pc_aep_cog.tif` | raster | 31,448 x 33,504 px | 139.7 MB |
| `dr_peak_flood_hazard_1pc_aep_cog.tif` | raster | 31,448 x 33,504 px | 20.0 MB |
| `dr_peak_flood_level_1pc_aep_cog.tif` | raster | 31,448 x 33,504 px | 118.5 MB |
| `dr_peak_flood_velocity_1pc_aep_cog.tif` | raster | 31,448 x 33,504 px | 139.5 MB |
| `riv_peak_flood_depth_1pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 101.7 MB |
| `riv_peak_flood_hazard_1pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 9.7 MB |
| `riv_peak_flood_level_1pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 61.7 MB |
| `riv_peak_flood_velocity_1pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 107.6 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_1_percent_aep/statewide/dr_peak_flood_depth_1pc_aep_cog.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_1_percent_aep/statewide/dr_peak_flood_depth_1pc_aep_cog.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Ftsfm_1_percent_aep%2Fstatewide%2Fdr_peak_flood_depth_1pc_aep_cog.tif

## Source

- [TSFM_1_PERCENT_AEP_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TSFM_1_PERCENT_AEP_STATEWIDE.zip), released 2026-02-18

## Attribution

"TSFM 1 Percent AEP" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

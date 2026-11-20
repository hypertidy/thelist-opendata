# TSFM 1 Percent AEP Climate Change

TSFM 1 Percent AEP Climate Change: LIST product `TSFM_1_PERCENT_AEP_CLIMATE_CHANGE`, statewide. Float32 grid, 10 x 10 cells, EPSG:28355; 8 grids. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-02-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TSFM 1 Percent AEP Climate Change" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `dr_peak_flood_depth_1pc_aep_cc_cog.tif` | raster | 31,448 x 33,517 px | 160.2 MB |
| `dr_peak_flood_hazard_1pc_aep_cc_cog.tif` | raster | 31,448 x 33,517 px | 22.4 MB |
| `dr_peak_flood_level_1pc_aep_cc_cog.tif` | raster | 31,448 x 33,517 px | 136.1 MB |
| `dr_peak_flood_velocity_1pc_aep_cc_cog.tif` | raster | 31,448 x 33,517 px | 159.9 MB |
| `riv_peak_flood_depth_1pc_aep_cc_cog.tif` | raster | 31,579 x 33,464 px | 108.0 MB |
| `riv_peak_flood_hazard_1pc_aep_cc_cog.tif` | raster | 31,579 x 33,464 px | 10.0 MB |
| `riv_peak_flood_level_1pc_aep_cc_cog.tif` | raster | 31,579 x 33,464 px | 65.0 MB |
| `riv_peak_flood_velocity_1pc_aep_cc_cog.tif` | raster | 31,579 x 33,464 px | 113.8 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_1_percent_aep_climate_change/statewide/dr_peak_flood_depth_1pc_aep_cc_cog.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_1_percent_aep_climate_change/statewide/dr_peak_flood_depth_1pc_aep_cc_cog.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Ftsfm_1_percent_aep_climate_change%2Fstatewide%2Fdr_peak_flood_depth_1pc_aep_cc_cog.tif

## Source

- [TSFM_1_PERCENT_AEP_CLIMATE_CHANGE_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TSFM_1_PERCENT_AEP_CLIMATE_CHANGE_STATEWIDE.zip), released 2026-02-18

## Attribution

"TSFM 1 Percent AEP Climate Change" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

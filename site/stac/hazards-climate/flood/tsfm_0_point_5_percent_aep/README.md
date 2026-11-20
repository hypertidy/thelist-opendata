# TSFM 0 Point 5 Percent AEP

TSFM 0 Point 5 Percent AEP: LIST product `TSFM_0_POINT_5_PERCENT_AEP`, statewide. Float32 grid, 10 x 10 cells, EPSG:28355; 8 grids. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-02-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TSFM 0 Point 5 Percent AEP" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `dr_peak_flood_depth_0pt5pc_aep_cog.tif` | raster | 31,448 x 33,517 px | 156.3 MB |
| `dr_peak_flood_hazard_0pt5pc_aep_cog.tif` | raster | 31,448 x 33,517 px | 21.9 MB |
| `dr_peak_flood_level_0pt5pc_aep_cog.tif` | raster | 31,448 x 33,517 px | 133.1 MB |
| `dr_peak_flood_velocity_0pt5pc_aep_cog.tif` | raster | 31,448 x 33,517 px | 156.1 MB |
| `riv_peak_flood_depth_0pt5pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 106.1 MB |
| `riv_peak_flood_hazard_0pt5pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 9.9 MB |
| `riv_peak_flood_level_0pt5pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 64.4 MB |
| `riv_peak_flood_velocity_0pt5pc_aep_cog.tif` | raster | 31,579 x 33,464 px | 112.3 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_0_point_5_percent_aep/statewide/dr_peak_flood_depth_0pt5pc_aep_cog.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_0_point_5_percent_aep/statewide/dr_peak_flood_depth_0pt5pc_aep_cog.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Ftsfm_0_point_5_percent_aep%2Fstatewide%2Fdr_peak_flood_depth_0pt5pc_aep_cog.tif

## Source

- [TSFM_0_POINT_5_PERCENT_AEP_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TSFM_0_POINT_5_PERCENT_AEP_STATEWIDE.zip), released 2026-02-18

## Attribution

"TSFM 0 Point 5 Percent AEP" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

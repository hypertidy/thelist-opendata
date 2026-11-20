# TSFM Calibration Data Depth

TSFM Calibration Data Depth: LIST product `TSFM_CALIBRATION_DATA_DEPTH`, statewide. Float32 grid, 10 x 10 cells, EPSG:28355; 16 grids. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-04-29. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TSFM Calibration Data Depth" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tsfm_cal_event_1969_05_depth_cog.tif` | raster | 15,505 x 19,237 px | 36.2 MB |
| `tsfm_cal_event_1970_08_depth_cog.tif` | raster | 19,921 x 18,095 px | 8.8 MB |
| `tsfm_cal_event_2000_07_depth_cog.tif` | raster | 18,094 x 9,912 px | 9.2 MB |
| `tsfm_cal_event_2004_01_depth_cog.tif` | raster | 3,482 x 5,155 px | 1.7 MB |
| `tsfm_cal_event_2005_08_depth_cog.tif` | raster | 3,108 x 4,362 px | 1.6 MB |
| `tsfm_cal_event_2005_09_depth_cog.tif` | raster | 5,480 x 9,139 px | 2.4 MB |
| `tsfm_cal_event_2007_08_depth_cog.tif` | raster | 28,369 x 31,608 px | 5.4 MB |
| `tsfm_cal_event_2009_09_depth_cog.tif` | raster | 5,481 x 9,140 px | 2.3 MB |
| `tsfm_cal_event_2011_01_depth_cog.tif` | raster | 26,551 x 13,352 px | 23.3 MB |
| `tsfm_cal_event_2011_03_depth_cog.tif` | raster | 15,689 x 17,481 px | 36.0 MB |
| `tsfm_cal_event_2013_08_depth_cog.tif` | raster | 3,776 x 4,252 px | 1.2 MB |
| `tsfm_cal_event_2013_09_depth_cog.tif` | raster | 7,642 x 9,053 px | 5.9 MB |
| `tsfm_cal_event_2016_01_depth_cog.tif` | raster | 3,894 x 6,312 px | 3.5 MB |
| `tsfm_cal_event_2016_06_depth_cog.tif` | raster | 31,558 x 30,437 px | 85.9 MB |
| `tsfm_cal_event_2016_07_depth_cog.tif` | raster | 10,997 x 24,955 px | 30.7 MB |
| `tsfm_cal_event_2018_05_depth_cog.tif` | raster | 5,481 x 9,140 px | 2.3 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_calibration_data_depth/statewide/tsfm_cal_event_1969_05_depth_cog.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_calibration_data_depth/statewide/tsfm_cal_event_1969_05_depth_cog.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Ftsfm_calibration_data_depth%2Fstatewide%2Ftsfm_cal_event_1969_05_depth_cog.tif

## Source

- [TSFM_CALIBRATION_DATA_DEPTH_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TSFM_CALIBRATION_DATA_DEPTH_STATEWIDE.zip), released 2026-04-29

## Attribution

"TSFM Calibration Data Depth" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

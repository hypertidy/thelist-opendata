# TSFM Calibration Data Velocity

TSFM Calibration Data Velocity: LIST product `TSFM_CALIBRATION_DATA_VELOCITY`, statewide. Float32 grid, 10 x 10 cells, EPSG:28355; 16 grids. Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2026-04-29. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "TSFM Calibration Data Velocity" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `tsfm_cal_event_1969_05_velocity_cog.tif` | raster | 15,505 x 19,237 px | 38.1 MB |
| `tsfm_cal_event_1970_08_velocity_cog.tif` | raster | 19,921 x 18,095 px | 8.9 MB |
| `tsfm_cal_event_2000_07_velocity_cog.tif` | raster | 18,094 x 9,912 px | 9.8 MB |
| `tsfm_cal_event_2004_01_velocity_cog.tif` | raster | 3,482 x 5,155 px | 1.8 MB |
| `tsfm_cal_event_2005_08_velocity_cog.tif` | raster | 3,108 x 4,362 px | 1.6 MB |
| `tsfm_cal_event_2005_09_velocity_cog.tif` | raster | 5,480 x 9,139 px | 3.5 MB |
| `tsfm_cal_event_2007_08_velocity_cog.tif` | raster | 28,397 x 31,608 px | 7.6 MB |
| `tsfm_cal_event_2009_09_velocity_cog.tif` | raster | 5,481 x 9,140 px | 3.4 MB |
| `tsfm_cal_event_2011_01_velocity_cog.tif` | raster | 26,551 x 13,352 px | 23.6 MB |
| `tsfm_cal_event_2011_03_velocity_cog.tif` | raster | 15,689 x 17,481 px | 37.3 MB |
| `tsfm_cal_event_2013_08_velocity_cog.tif` | raster | 3,776 x 4,252 px | 1.2 MB |
| `tsfm_cal_event_2013_09_velocity_cog.tif` | raster | 7,642 x 9,053 px | 7.4 MB |
| `tsfm_cal_event_2016_01_velocity_cog.tif` | raster | 3,894 x 6,312 px | 4.2 MB |
| `tsfm_cal_event_2016_06_velocity_cog.tif` | raster | 31,558 x 30,437 px | 91.1 MB |
| `tsfm_cal_event_2016_07_velocity_cog.tif` | raster | 10,997 x 24,955 px | 31.3 MB |
| `tsfm_cal_event_2018_05_velocity_cog.tif` | raster | 5,481 x 9,140 px | 3.4 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_calibration_data_velocity/statewide/tsfm_cal_event_1969_05_velocity_cog.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/tsfm_calibration_data_velocity/statewide/tsfm_cal_event_1969_05_velocity_cog.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Ftsfm_calibration_data_velocity%2Fstatewide%2Ftsfm_cal_event_1969_05_velocity_cog.tif

## Source

- [TSFM_CALIBRATION_DATA_VELOCITY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/TSFM_CALIBRATION_DATA_VELOCITY_STATEWIDE.zip), released 2026-04-29

## Attribution

"TSFM Calibration Data Velocity" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

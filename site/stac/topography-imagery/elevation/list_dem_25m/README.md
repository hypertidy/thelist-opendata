# LIST DEM 25 m

LIST DEM 25 m: LIST product `LIST_DEM_25M`, statewide. Float32 grid, 25 x 25 cells, EPSG:28355. Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per feature id, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2021-01-13. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST DEM 25 m" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_dem_25m_statewide.tif` | raster | 15,946 x 20,078 px | 336.0 MB |

## Read it in place

```sh
gdal raster info /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/cog/list_dem_25m/statewide/list_dem_25m_statewide.tif
```

```python
import rasterio
src = rasterio.open("https://data.source.coop/mdsumner/thelist-opendata/cog/list_dem_25m/statewide/list_dem_25m_statewide.tif")
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#cog%2Flist_dem_25m%2Fstatewide%2Flist_dem_25m_statewide.tif

## Source

- [LIST_DEM_25M_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_BRIGHTON.zip), released 2021-01-13
- [LIST_DEM_25M_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_BURNIE.zip), released 2021-01-13
- [LIST_DEM_25M_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CENTRAL_COAST.zip), released 2021-01-13
- [LIST_DEM_25M_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CENTRAL_HIGHLANDS.zip), released 2021-01-13
- [LIST_DEM_25M_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CIRCULAR_HEAD.zip), released 2021-01-13
- [LIST_DEM_25M_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CLARENCE.zip), released 2021-01-13
- [LIST_DEM_25M_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_DERWENT_VALLEY.zip), released 2021-01-13
- [LIST_DEM_25M_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_DEVONPORT.zip), released 2021-01-13
- [LIST_DEM_25M_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_DORSET.zip), released 2021-01-13
- [LIST_DEM_25M_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_GEORGE_TOWN.zip), released 2021-01-13
- [LIST_DEM_25M_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_GLENORCHY.zip), released 2021-01-13
- [LIST_DEM_25M_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_HOBART.zip), released 2021-01-13
- [LIST_DEM_25M_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_HUON_VALLEY.zip), released 2021-01-13
- [LIST_DEM_25M_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_KENTISH.zip), released 2021-01-13
- [LIST_DEM_25M_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_KING_ISLAND.zip), released 2021-01-13
- [LIST_DEM_25M_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_KINGBOROUGH.zip), released 2021-01-13
- [LIST_DEM_25M_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_LATROBE.zip), released 2021-01-13
- [LIST_DEM_25M_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_LAUNCESTON.zip), released 2021-01-13
- [LIST_DEM_25M_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_MEANDER_VALLEY.zip), released 2021-01-13
- [LIST_DEM_25M_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_NORTHERN_MIDLANDS.zip), released 2021-01-13
- [LIST_DEM_25M_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_SORELL.zip), released 2021-01-13
- [LIST_DEM_25M_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_SOUTHERN_MIDLANDS.zip), released 2021-01-13
- [LIST_DEM_25M_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_WARATAH_WYNYARD.zip), released 2021-01-13
- [LIST_DEM_25M_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_WEST_COAST.zip), released 2021-01-13
- [LIST_DEM_25M_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_WEST_TAMAR.zip), released 2021-01-13
- [LIST_DEM_25M_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_GLAMORGAN_SPRING_BAY.zip), released 2021-01-13
- [LIST_DEM_25M_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_BREAK_O_DAY.zip), released 2021-01-13
- [LIST_DEM_25M_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_FLINDERS.zip), released 2021-01-13
- [LIST_DEM_25M_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_TASMAN.zip), released 2021-01-13

## Attribution

"LIST DEM 25 m" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

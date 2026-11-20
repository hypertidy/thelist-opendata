# LIST Landslide Planning Map Hazard Bands

LIST Landslide Planning Map Hazard Bands: LIST product `LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS`, statewide. 1,387,572 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2021-01-19. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Landslide Planning Map Hazard Bands" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_landslide_planning_map_hazard_bands_statewide.parquet` | vector | 1,387,572 | 129.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_landslide_planning_map_hazard_bands/statewide/list_landslide_planning_map_hazard_bands_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_landslide_planning_map_hazard_bands/statewide/list_landslide_planning_map_hazard_bands_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_landslide_planning_map_hazard_bands%2Fstatewide%2Flist_landslide_planning_map_hazard_bands_statewide.parquet

## Columns

`HAZARD_BAND_1` (string), `COMPONENT` (string), `NAME` (string), `NAME_1` (string), `REGION` (string), `HAZARD_EXPOSURE` (string), `VERSION` (string), `VERSION_DATE` (string), `FURTHER_INFORMATION` (string), `LIST_GUID` (string), `DISCLAIMER` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_BREAK_O_DAY.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_BRIGHTON.zip), released 2021-01-18
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_BURNIE.zip), released 2021-01-18
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CENTRAL_COAST.zip), released 2021-01-18
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CENTRAL_HIGHLANDS.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CIRCULAR_HEAD.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_CLARENCE.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_DERWENT_VALLEY.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_DEVONPORT.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_DORSET.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_FLINDERS.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_GEORGE_TOWN.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_GLAMORGAN_SPRING_BAY.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_GLENORCHY.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_HOBART.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_HUON_VALLEY.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_KENTISH.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_KING_ISLAND.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_KINGBOROUGH.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_LATROBE.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_LAUNCESTON.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_MEANDER_VALLEY.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_NORTHERN_MIDLANDS.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_SORELL.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_SOUTHERN_MIDLANDS.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_TASMAN.zip), released 2021-01-18
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_WARATAH_WYNYARD.zip), released 2021-01-18
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_WEST_COAST.zip), released 2021-01-19
- [LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LANDSLIDE_PLANNING_MAP_HAZARD_BANDS_WEST_TAMAR.zip), released 2021-01-19

## Attribution

"LIST Landslide Planning Map Hazard Bands" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

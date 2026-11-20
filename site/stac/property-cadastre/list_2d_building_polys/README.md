# LIST 2D Building Polys

LIST 2D Building Polys: LIST product `LIST_2D_BUILDING_POLYS`, statewide. 462,218 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST 2D Building Polys" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_2d_building_polys_statewide.parquet` | vector | 462,218 | 67.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_2d_building_polys/statewide/list_2d_building_polys_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_2d_building_polys/statewide/list_2d_building_polys_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_2d_building_polys%2Fstatewide%2Flist_2d_building_polys_statewide.parquet

## Columns

`BUILD_ID` (double), `BUILD_TY` (string), `BUILD_NAME` (string), `BLD_PUR` (string), `MEAN_HGT` (float), `NOM_REG_NO` (string), `FEAT_REL` (datetime), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_2D_BUILDING_POLYS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_BRIGHTON.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_BURNIE.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_CLARENCE.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_DEVONPORT.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_DORSET.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_FLINDERS.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_GLENORCHY.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_HOBART.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_KENTISH.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_KING_ISLAND.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_LATROBE.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_LAUNCESTON.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_SORELL.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_TASMAN.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_WEST_COAST.zip), released 2025-07-17
- [LIST_2D_BUILDING_POLYS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_2D_BUILDING_POLYS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST 2D Building Polys" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Building Pts

LIST Building Pts: LIST product `LIST_BUILDING_PTS`, statewide. 179,989 features, multi-point (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2023-06-08. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Building Pts" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_building_pts_statewide.parquet` | vector | 179,989 | 14.5 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_building_pts/statewide/list_building_pts_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_building_pts/statewide/list_building_pts_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_building_pts%2Fstatewide%2Flist_building_pts_statewide.parquet

## Columns

`BUILD_ID` (int32), `BUILD_TY` (string), `BUILD_NAME` (string), `BLD_PUR` (string), `MEAN_HGT` (float), `ROTATION` (int16), `OFFSET_X` (int16), `OFFSET_Y` (int16), `OFF_SCALE` (int32), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `NOM_REG_NO` (string), `FEAT_REL` (datetime), `lga` (string)

## Source

- [LIST_BUILDING_PTS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_BREAK_O_DAY.zip), released 2023-06-08
- [LIST_BUILDING_PTS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_BRIGHTON.zip), released 2023-06-08
- [LIST_BUILDING_PTS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_BURNIE.zip), released 2023-06-08
- [LIST_BUILDING_PTS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_CENTRAL_COAST.zip), released 2023-06-08
- [LIST_BUILDING_PTS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_CENTRAL_HIGHLANDS.zip), released 2023-06-08
- [LIST_BUILDING_PTS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_CIRCULAR_HEAD.zip), released 2023-06-08
- [LIST_BUILDING_PTS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_CLARENCE.zip), released 2023-06-08
- [LIST_BUILDING_PTS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_DERWENT_VALLEY.zip), released 2023-06-08
- [LIST_BUILDING_PTS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_DEVONPORT.zip), released 2023-06-08
- [LIST_BUILDING_PTS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_DORSET.zip), released 2023-06-08
- [LIST_BUILDING_PTS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_FLINDERS.zip), released 2023-06-08
- [LIST_BUILDING_PTS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_GEORGE_TOWN.zip), released 2023-06-08
- [LIST_BUILDING_PTS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_GLAMORGAN_SPRING_BAY.zip), released 2023-06-08
- [LIST_BUILDING_PTS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_GLENORCHY.zip), released 2023-06-08
- [LIST_BUILDING_PTS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_HOBART.zip), released 2023-06-08
- [LIST_BUILDING_PTS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_HUON_VALLEY.zip), released 2023-06-08
- [LIST_BUILDING_PTS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_KENTISH.zip), released 2023-06-08
- [LIST_BUILDING_PTS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_KING_ISLAND.zip), released 2023-06-08
- [LIST_BUILDING_PTS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_KINGBOROUGH.zip), released 2023-06-08
- [LIST_BUILDING_PTS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_LATROBE.zip), released 2023-06-08
- [LIST_BUILDING_PTS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_LAUNCESTON.zip), released 2023-06-08
- [LIST_BUILDING_PTS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_MEANDER_VALLEY.zip), released 2023-06-08
- [LIST_BUILDING_PTS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_NORTHERN_MIDLANDS.zip), released 2023-06-08
- [LIST_BUILDING_PTS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_SORELL.zip), released 2023-06-08
- [LIST_BUILDING_PTS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_SOUTHERN_MIDLANDS.zip), released 2023-06-08
- [LIST_BUILDING_PTS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_TASMAN.zip), released 2023-06-08
- [LIST_BUILDING_PTS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_WARATAH_WYNYARD.zip), released 2023-06-08
- [LIST_BUILDING_PTS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_WEST_COAST.zip), released 2023-06-08
- [LIST_BUILDING_PTS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BUILDING_PTS_WEST_TAMAR.zip), released 2023-06-08

## Attribution

"LIST Building Pts" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

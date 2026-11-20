# LIST TASVEG 40

LIST TASVEG 40: LIST product `LIST_TASVEG_40`, statewide. 468,084 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips by stacking them, with an `lga` column: this layer has no feature id, so features crossing an LGA boundary stay cut there. Source released 2020-09-23. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 40" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasveg_40_statewide.parquet` | vector | 468,084 | 384.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_40/statewide/list_tasveg_40_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_40/statewide/list_tasveg_40_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_40%2Fstatewide%2Flist_tasveg_40_statewide.parquet

## Columns

`VEGCODE` (string), `FOREST_STR` (string), `CANOPY_TRE` (string), `SOURCE_TYP` (string), `SOURCE_DAT` (datetime), `SOURCE_IRS` (string), `FIELD_CHEC` (datetime), `PROJECT` (string), `SHAPE_LENG` (double), `VEG_GROUP` (string), `VEGCODE_D` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_TASVEG_40_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_BREAK_O_DAY.zip), released 2020-09-23
- [LIST_TASVEG_40_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_BRIGHTON.zip), released 2020-09-23
- [LIST_TASVEG_40_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_BURNIE.zip), released 2020-09-23
- [LIST_TASVEG_40_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_CENTRAL_COAST.zip), released 2020-09-23
- [LIST_TASVEG_40_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_CENTRAL_HIGHLANDS.zip), released 2020-09-23
- [LIST_TASVEG_40_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_CIRCULAR_HEAD.zip), released 2020-09-23
- [LIST_TASVEG_40_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_CLARENCE.zip), released 2020-09-23
- [LIST_TASVEG_40_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_DERWENT_VALLEY.zip), released 2020-09-23
- [LIST_TASVEG_40_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_DEVONPORT.zip), released 2020-09-23
- [LIST_TASVEG_40_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_DORSET.zip), released 2020-09-23
- [LIST_TASVEG_40_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FLINDERS.zip), released 2020-09-23
- [LIST_TASVEG_40_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_GEORGE_TOWN.zip), released 2020-09-23
- [LIST_TASVEG_40_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_GLAMORGAN_SPRING_BAY.zip), released 2020-09-23
- [LIST_TASVEG_40_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_GLENORCHY.zip), released 2020-09-23
- [LIST_TASVEG_40_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_HOBART.zip), released 2020-09-23
- [LIST_TASVEG_40_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_HUON_VALLEY.zip), released 2020-09-23
- [LIST_TASVEG_40_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_KENTISH.zip), released 2020-09-23
- [LIST_TASVEG_40_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_KING_ISLAND.zip), released 2020-09-23
- [LIST_TASVEG_40_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_KINGBOROUGH.zip), released 2020-09-23
- [LIST_TASVEG_40_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_LATROBE.zip), released 2020-09-23
- [LIST_TASVEG_40_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_LAUNCESTON.zip), released 2020-09-23
- [LIST_TASVEG_40_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_MEANDER_VALLEY.zip), released 2020-09-23
- [LIST_TASVEG_40_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_NORTHERN_MIDLANDS.zip), released 2020-09-23
- [LIST_TASVEG_40_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_SORELL.zip), released 2020-09-23
- [LIST_TASVEG_40_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_SOUTHERN_MIDLANDS.zip), released 2020-09-23
- [LIST_TASVEG_40_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_TASMAN.zip), released 2020-09-23
- [LIST_TASVEG_40_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_WARATAH_WYNYARD.zip), released 2020-09-23
- [LIST_TASVEG_40_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_WEST_COAST.zip), released 2020-09-23
- [LIST_TASVEG_40_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_WEST_TAMAR.zip), released 2020-09-23

## Attribution

"LIST TASVEG 40" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

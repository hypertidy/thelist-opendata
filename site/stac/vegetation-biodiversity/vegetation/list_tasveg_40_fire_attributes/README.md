# LIST TASVEG 40 Fire Attributes

LIST TASVEG 40 Fire Attributes: LIST product `LIST_TASVEG_40_FIRE_ATTRIBUTES`, statewide. 468,084 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips by stacking them, with an `lga` column: this layer has no feature id, so features crossing an LGA boundary stay cut there. Source released 2020-11-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 40 Fire Attributes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasveg_40_fire_attributes_statewide.parquet` | vector | 468,084 | 381.0 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_40_fire_attributes/statewide/list_tasveg_40_fire_attributes_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_40_fire_attributes/statewide/list_tasveg_40_fire_attributes_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_40_fire_attributes%2Fstatewide%2Flist_tasveg_40_fire_attributes_statewide.parquet

## Columns

`VEGCODE` (string), `VEGCODE_D` (string), `VEG_GROUP` (string), `SOURCE_DAT` (datetime), `PHOENIX_ID` (double), `FIREATT` (string), `FIRESENS` (string), `FLAMMAB` (string), `FRB_TREAT` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_TASVEG_40_FIRE_ATTRIBUTES_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_BREAK_O_DAY.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_BRIGHTON.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_BURNIE.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_CENTRAL_COAST.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_CENTRAL_HIGHLANDS.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_CIRCULAR_HEAD.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_CLARENCE.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_DERWENT_VALLEY.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_DEVONPORT.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_DORSET.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_FLINDERS.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_GEORGE_TOWN.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_GLAMORGAN_SPRING_BAY.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_GLENORCHY.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_HOBART.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_HUON_VALLEY.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_KENTISH.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_KING_ISLAND.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_KINGBOROUGH.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_LATROBE.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_LAUNCESTON.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_MEANDER_VALLEY.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_NORTHERN_MIDLANDS.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_SORELL.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_SOUTHERN_MIDLANDS.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_TASMAN.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_WARATAH_WYNYARD.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_WEST_COAST.zip), released 2020-11-04
- [LIST_TASVEG_40_FIRE_ATTRIBUTES_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_40_FIRE_ATTRIBUTES_WEST_TAMAR.zip), released 2020-11-04

## Attribution

"LIST TASVEG 40 Fire Attributes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

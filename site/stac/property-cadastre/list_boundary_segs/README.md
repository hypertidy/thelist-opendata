# LIST Boundary Segs

LIST Boundary Segs: LIST product `LIST_BOUNDARY_SEGS`, statewide. 1,977,773 features, multi-linestring (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Boundary Segs" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_boundary_segs_statewide.parquet` | vector | 1,977,773 | 207.2 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_boundary_segs/statewide/list_boundary_segs_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_boundary_segs/statewide/list_boundary_segs_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_boundary_segs%2Fstatewide%2Flist_boundary_segs_statewide.parquet

## Columns

`BDY_SEG_ID` (int32), `FEAT_FOL` (string), `FOREIGN_ID` (string), `NOTE` (string), `HACC` (string), `SOURCE` (string), `COMP_LEN` (double), `UFI` (string), `FMP` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `lga` (string)

## Source

- [LIST_BOUNDARY_SEGS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_BRIGHTON.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_BURNIE.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_CLARENCE.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_DEVONPORT.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_DORSET.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_FLINDERS.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_GLENORCHY.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_HOBART.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_KENTISH.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_KING_ISLAND.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_LATROBE.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_LAUNCESTON.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_SORELL.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_TASMAN.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_WEST_COAST.zip), released 2025-07-17
- [LIST_BOUNDARY_SEGS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_BOUNDARY_SEGS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST Boundary Segs" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

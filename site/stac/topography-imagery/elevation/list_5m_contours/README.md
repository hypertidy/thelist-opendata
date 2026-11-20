# LIST 5 m Contours

LIST 5 m Contours: LIST product `LIST_5M_CONTOURS`, statewide. 70,668 features, multi-linestring (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST 5 m Contours" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_5m_contours_statewide.parquet` | vector | 70,668 | 84.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_5m_contours/statewide/list_5m_contours_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_5m_contours/statewide/list_5m_contours_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_5m_contours%2Fstatewide%2Flist_5m_contours_statewide.parquet

## Columns

`CONTOUR_ID` (double), `CONTOUR_TY` (string), `ELEVATION` (int32), `COMP_LEN` (double), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `lga` (string)

## Source

- [LIST_5M_CONTOURS_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_5M_CONTOURS_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_BRIGHTON.zip), released 2025-07-17
- [LIST_5M_CONTOURS_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_BURNIE.zip), released 2025-07-17
- [LIST_5M_CONTOURS_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_5M_CONTOURS_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_5M_CONTOURS_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_5M_CONTOURS_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_CLARENCE.zip), released 2025-07-17
- [LIST_5M_CONTOURS_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_5M_CONTOURS_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_DEVONPORT.zip), released 2025-07-17
- [LIST_5M_CONTOURS_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_DORSET.zip), released 2025-07-17
- [LIST_5M_CONTOURS_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_FLINDERS.zip), released 2025-07-17
- [LIST_5M_CONTOURS_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_5M_CONTOURS_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_5M_CONTOURS_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_GLENORCHY.zip), released 2025-07-17
- [LIST_5M_CONTOURS_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_HOBART.zip), released 2025-07-17
- [LIST_5M_CONTOURS_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_HUON_VALLEY.zip), released 2025-07-17
- [LIST_5M_CONTOURS_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_KENTISH.zip), released 2025-07-17
- [LIST_5M_CONTOURS_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_KING_ISLAND.zip), released 2025-07-17
- [LIST_5M_CONTOURS_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_KINGBOROUGH.zip), released 2025-07-17
- [LIST_5M_CONTOURS_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_LATROBE.zip), released 2025-07-17
- [LIST_5M_CONTOURS_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_LAUNCESTON.zip), released 2025-07-17
- [LIST_5M_CONTOURS_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_5M_CONTOURS_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_5M_CONTOURS_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_SORELL.zip), released 2025-07-17
- [LIST_5M_CONTOURS_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_5M_CONTOURS_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_TASMAN.zip), released 2025-07-17
- [LIST_5M_CONTOURS_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_5M_CONTOURS_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_WEST_COAST.zip), released 2025-07-17
- [LIST_5M_CONTOURS_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_5M_CONTOURS_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST 5 m Contours" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# Wedgetailed Eagle Nesting Habitat Low

Wedgetailed Eagle Nesting Habitat Low: LIST product `WEDGETAILED_EAGLE_NESTING_HABITAT_LOW`, statewide. 4,545,271 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `ID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2024-01-10. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Wedgetailed Eagle Nesting Habitat Low" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `wedgetailed_eagle_nesting_habitat_low_statewide.parquet` | vector | 4,545,271 | 202.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/wedgetailed_eagle_nesting_habitat_low/statewide/wedgetailed_eagle_nesting_habitat_low_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/wedgetailed_eagle_nesting_habitat_low/statewide/wedgetailed_eagle_nesting_habitat_low_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fwedgetailed_eagle_nesting_habitat_low%2Fstatewide%2Fwedgetailed_eagle_nesting_habitat_low_statewide.parquet

## Columns

`ID` (int32), `GRIDCODE` (int32), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_BREAK_O_DAY.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_BRIGHTON.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_BURNIE.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CENTRAL_COAST.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CENTRAL_HIGHLANDS.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CIRCULAR_HEAD.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_CLARENCE.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_DERWENT_VALLEY.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_DEVONPORT.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_DORSET.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_FLINDERS.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_GEORGE_TOWN.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_GLAMORGAN_SPRING_BAY.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_GLENORCHY.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_HOBART.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_HUON_VALLEY.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_KENTISH.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_KING_ISLAND.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_KINGBOROUGH.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_LATROBE.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_LAUNCESTON.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_MEANDER_VALLEY.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_NORTHERN_MIDLANDS.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_SORELL.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_SOUTHERN_MIDLANDS.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_TASMAN.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_WARATAH_WYNYARD.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_WEST_COAST.zip), released 2024-01-10
- [WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_LOW_WEST_TAMAR.zip), released 2024-01-10

## Attribution

"Wedgetailed Eagle Nesting Habitat Low" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

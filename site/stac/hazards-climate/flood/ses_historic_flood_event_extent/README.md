# SES Historic Flood Event Extent

SES Historic Flood Event Extent: LIST product `SES_HISTORIC_FLOOD_EVENT_EXTENT`, statewide. 2,181 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2022-09-16. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "SES Historic Flood Event Extent" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `flood_extent_august_1970.parquet` | vector | 2,181 | 395.4 KB |
| `flood_extent_august_2007.parquet` | vector | 3,543 | 1.3 MB |
| `flood_extent_august_2013.parquet` | vector | 433 | 130.4 KB |
| `flood_extent_january_2004.parquet` | vector | 738 | 169.4 KB |
| `flood_extent_january_2011.parquet` | vector | 5,745 | 1.8 MB |
| `flood_extent_july_2000.parquet` | vector | 3,965 | 623.4 KB |
| `flood_extent_july_2016.parquet` | vector | 1,217 | 386.8 KB |
| `flood_extent_june_2016.parquet` | vector | 15,197 | 3.1 MB |
| `flood_extent_march_2011.parquet` | vector | 694 | 507.1 KB |
| `flood_extent_may_1969.parquet` | vector | 3,825 | 703.7 KB |
| `flood_extent_may_2018.parquet` | vector | 6,603 | 473.4 KB |
| `flood_extent_september_2005.parquet` | vector | 6,583 | 477.0 KB |
| `flood_extent_september_2009.parquet` | vector | 6,555 | 473.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/ses_historic_flood_event_extent/statewide/flood_extent_august_1970.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/ses_historic_flood_event_extent/statewide/flood_extent_august_1970.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fses_historic_flood_event_extent%2Fstatewide%2Fflood_extent_august_1970.parquet

## Columns

`Shape_Length` (double), `Shape_Area` (double)

## Source

- [SES_HISTORIC_FLOOD_EVENT_EXTENT_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/SES_HISTORIC_FLOOD_EVENT_EXTENT_STATEWIDE.zip), released 2022-09-16

## Attribution

"SES Historic Flood Event Extent" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

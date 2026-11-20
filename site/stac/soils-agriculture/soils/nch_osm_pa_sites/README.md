# NCH OSM Pa Sites

NCH OSM Pa Sites: LIST product `NCH_OSM_PA_SITES`, statewide. 2,096 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2023-10-03. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "NCH OSM Pa Sites" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `osm_pa_sites.parquet` | vector | 2,096 | 84.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/nch_osm_pa_sites/statewide/osm_pa_sites.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/nch_osm_pa_sites/statewide/osm_pa_sites.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fnch_osm_pa_sites%2Fstatewide%2Fosm_pa_sites.parquet

## Columns

`Easting` (int32), `Northing` (int32), `Organic_So` (string), `Site_ID` (string), `Source` (string), `Site_Facts` (string)

## Source

- [NCH_OSM_PA_SITES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/NCH_OSM_PA_SITES_STATEWIDE.zip), released 2023-10-03

## Attribution

"NCH OSM Pa Sites" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

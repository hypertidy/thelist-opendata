# EPA Aquatic Ecosystem DGVS For Surface Water Catchments

EPA Aquatic Ecosystem DGVS For Surface Water Catchments: LIST product `EPA_AQUATIC_ECOSYSTEM_DGVS_FOR_SURFACE_WATER_CATCHMENTS`, statewide. 48 features, multi-polygon z (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-02-03. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "EPA Aquatic Ecosystem DGVS For Surface Water Catchments" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `epa_aquatic_ecosystem_dgvs_for_surface_water_catchments_statewide.parquet` | vector | 48 | 8.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_aquatic_ecosystem_dgvs_for_surface_water_catchments/statewide/epa_aquatic_ecosystem_dgvs_for_surface_water_catchments_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_aquatic_ecosystem_dgvs_for_surface_water_catchments/statewide/epa_aquatic_ecosystem_dgvs_for_surface_water_catchments_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fepa_aquatic_ecosystem_dgvs_for_surface_water_catchments%2Fstatewide%2Fepa_aquatic_ecosystem_dgvs_for_surface_water_catchments_statewide.parquet

## Columns

`CAT_NAME` (string), `DGVS_PEVS` (string), `DGVS_SUM` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [EPA_AQUATIC_ECOSYSTEM_DGVS_FOR_SURFACE_WATER_CATCHMENTS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/EPA_AQUATIC_ECOSYSTEM_DGVS_FOR_SURFACE_WATER_CATCHMENTS_STATEWIDE.zip), released 2021-02-03

## Attribution

"EPA Aquatic Ecosystem DGVS For Surface Water Catchments" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

# LIST Scalefish Blocks

LIST Scalefish Blocks: LIST product `LIST_SCALEFISH_BLOCKS`, statewide. 159 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Scalefish Blocks" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_scalefish_blocks_statewide.parquet` | vector | 159 | 5.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_scalefish_blocks/statewide/list_scalefish_blocks_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_scalefish_blocks/statewide/list_scalefish_blocks_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_scalefish_blocks%2Fstatewide%2Flist_scalefish_blocks_statewide.parquet

## Columns

`BLOCK` (string), `SUBBLOCK` (string), `LAND` (string), `ROCKLOBSTER_BLOCK` (string), `SCALEFISH_REGION` (string), `OCTOPUS_REGION` (string), `BANDED_MORWONG_REGION` (string), `DESCRIPTION` (string), `CALAMARI_REGION` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_SCALEFISH_BLOCKS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SCALEFISH_BLOCKS_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Scalefish Blocks" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.

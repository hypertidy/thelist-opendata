# Agents: LIST Shellmap Water Quality Sample Sites (`LIST_SHELLMAP_WATER_QUALITY_SAMPLE_SITES`)
General guidance for this catalogue: [AGENTS.md](../../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- `table:columns` lists the columns and types; `table:row_count` = 257.
- Filter on the `geometry_bbox` column to read only the row groups you need.
- Native CRS: OGC:CRS84. 
- Attribution required: "LIST Shellmap Water Quality Sample Sites" from theLIST (c) State of Tasmania (CC BY 3.0 AU).

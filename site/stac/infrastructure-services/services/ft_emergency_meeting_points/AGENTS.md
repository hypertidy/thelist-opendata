# Agents: FT Emergency Meeting Points (`FT_EMERGENCY_MEETING_POINTS`)
General guidance for this catalogue: [AGENTS.md](../../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- `table:columns` lists the columns and types; `table:row_count` = 271.
- Filter on the `geometry_bbox` column to read only the row groups you need.
- Native CRS: EPSG:28355. 
- Attribution required: "FT Emergency Meeting Points" from theLIST (c) State of Tasmania (CC BY 3.0 AU).

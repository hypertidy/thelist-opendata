# Agents: LIST DEM 25 m (`LIST_DEM_25M`)
General guidance for this catalogue: [AGENTS.md](../../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- COGs have internal overviews; read a window or an overview, not the full grid.
- Native CRS: EPSG:28355. 
- Built from the per-LGA LIST zips; the `lga` column names the source LGA(s). See the collection description.
- Attribution required: "LIST DEM 25 m" from theLIST (c) State of Tasmania (CC BY 3.0 AU).

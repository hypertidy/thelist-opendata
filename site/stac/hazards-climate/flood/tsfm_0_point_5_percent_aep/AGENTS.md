# Agents: TSFM 0 Point 5 Percent AEP (`TSFM_0_POINT_5_PERCENT_AEP`)
General guidance for this catalogue: [AGENTS.md](../../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
  and, for rasters, on one item per COG (`links` with rel `item`).
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- COGs have internal overviews; read a window or an overview, not the full grid.
- Native CRS: EPSG:28355. 
- Attribution required: "TSFM 0 Point 5 Percent AEP" from theLIST (c) State of Tasmania (CC BY 3.0 AU).

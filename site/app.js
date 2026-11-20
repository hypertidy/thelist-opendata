"use strict";
// Listing of the statewide files in the LIST open data mirror. Data: catalog.json,
// built by R/20_catalog.R from the store itself.

const state = { items: [], q: "", kind: "", src: "", sort: "title", open: null, cat: null, stac: {} };
const PORTOLAN = "https://browser.portolan-sdi.org/#/external/";
fetch("stac-paths.json").then((r) => (r.ok ? r.json() : {})).then((p) => { state.stac = p || {}; if (state.open) render(); }).catch(() => {});
const $ = (s, el = document) => el.querySelector(s);
const esc = (s) => String(s ?? "").replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
const fmtInt = (n) => (n == null ? "" : Number(n).toLocaleString("en-AU"));
function fmtBytes(b) {
  if (b == null) return "";
  const u = ["B", "KB", "MB", "GB", "TB"]; let i = 0; let v = b;
  while (v >= 1000 && i < u.length - 1) { v /= 1000; i++; }
  return (v >= 100 || i === 0 ? v.toFixed(0) : v.toFixed(1)) + " " + u[i];
}
const isMGA = (it) => (it.crs || "").startsWith("EPSG:28355") || !!it.crs_note;

// ---- load --------------------------------------------------------------------
fetch("catalog.json").then((r) => r.json()).then((cat) => {
  state.cat = cat;
  const perProduct = {};
  for (const it of cat.items) perProduct[it.product] = (perProduct[it.product] || 0) + 1;
  state.items = cat.items.map((it) => ({
    ...it,
    // several statewide files for one product: name each by its file
    layer: it.layer || (perProduct[it.product] > 1 ? it.path.split("/").pop() : null),
    released: it.source?.released || "",
    hay: [it.title, it.product, it.layer, it.path, it.geometry, it.crs,
          ...(it.columns || []).map((c) => c[0])].join(" ").toLowerCase(),
  }));
  const k = (x) => state.items.filter((i) => i.kind === x).length;
  const total = state.items.reduce((a, i) => a + (i.bytes || 0), 0);
  $("#stats").innerHTML = `<b>${state.items.length}</b> statewide datasets: <b>${k("vector")}</b> vector (GeoParquet),
    <b>${k("raster")}</b> raster (COG), <b>${k("table")}</b> tables (Parquet); <b>${fmtBytes(total)}</b> in all.
    <b>${state.items.filter((i) => i.source?.kind === "lga").length}</b> are built here from the per-LGA zips.`;
  $("#meta").textContent = `Catalogue generated ${cat.generated.slice(0, 10)} from the store at ${cat.https}.`;
  const q = new URLSearchParams(location.search).get("q");
  if (q) { $("#q").value = q; state.q = q.trim().toLowerCase(); }
  const h = decodeURIComponent(location.hash.slice(1));
  if (h && state.items.some((i) => i.path === h)) state.open = h;
  render();
  if (state.open) requestAnimationFrame(() => document.getElementById(rowId(state.open))?.scrollIntoView({ block: "start" }));
}).catch((e) => { $("#list").innerHTML = `<p class="empty">Could not load catalog.json (${esc(e.message)}).</p>`; });

// ---- controls -----------------------------------------------------------------
$("#q").addEventListener("input", (e) => { state.q = e.target.value.trim().toLowerCase(); render(); });
for (const id of ["kind", "src"]) {
  $("#" + id).addEventListener("click", (e) => {
    const b = e.target.closest("button"); if (!b) return;
    state[id] = b.dataset.v;
    for (const x of $("#" + id).querySelectorAll("button")) x.setAttribute("aria-pressed", String(x === b));
    render();
  });
}
$("#sort").addEventListener("change", (e) => { state.sort = e.target.value; render(); });
window.addEventListener("hashchange", () => {
  const h = decodeURIComponent(location.hash.slice(1));
  if (h !== state.open && state.items.some((i) => i.path === h)) { state.open = h; render(); document.getElementById(rowId(h))?.scrollIntoView({ block: "start" }); }
});

// ---- list -----------------------------------------------------------------------
const rowId = (path) => "d-" + path.replace(/[^a-z0-9]+/gi, "-");
function filtered() {
  const terms = state.q.split(/\s+/).filter(Boolean);
  let xs = state.items.filter((i) =>
    (!state.kind || i.kind === state.kind) &&
    (!state.src || i.source?.kind === state.src) &&
    terms.every((t) => i.hay.includes(t)));
  const s = state.sort;
  xs.sort((a, b) => s === "title" ? a.title.localeCompare(b.title) || a.path.localeCompare(b.path)
    : s === "released" ? String(b.released).localeCompare(String(a.released))
    : (b[s] ?? -1) - (a[s] ?? -1));
  return xs;
}
function sizeText(it) {
  if (it.kind === "raster" && it.raster) return `${fmtInt(it.raster.dim[0])} × ${fmtInt(it.raster.dim[1])} px`;
  return it.rows != null ? `${fmtInt(it.rows)} rows` : "";
}
function render() {
  const xs = filtered();
  const list = $("#list");
  if (!xs.length) { list.innerHTML = `<p class="empty">No datasets match.</p>`; return; }
  list.innerHTML = xs.map((it) => {
    const open = it.path === state.open;
    const geom = it.kind === "vector" ? (it.geometry || "vector").replace(/^Multi/, "") : it.kind === "raster" ? (it.raster?.dtype || "raster") : "table";
    return `<div class="row${open ? " open" : ""}" role="listitem" id="${rowId(it.path)}">
      <button class="row-head" type="button" aria-expanded="${open}" data-path="${esc(it.path)}">
        <span class="name"><span class="title">${esc(it.title)}</span>${it.layer ? ` <span class="code">· ${esc(it.layer)}</span>` : ""}<br>
          <span class="code mono">${esc(it.product)}</span></span>
        <span class="num">${sizeText(it)}</span>
        <span class="num">${fmtBytes(it.bytes)}</span>
        <span class="badges"><span class="badge ${it.kind}">${esc(geom)}</span>${it.source?.kind === "lga" ? `<span class="badge lga">built from ${it.source.n} LGAs</span>` : ""}</span>
      </button>
      ${open ? detail(it) : ""}
    </div>`;
  }).join("");
  for (const b of list.querySelectorAll(".row-head")) b.addEventListener("click", () => {
    const p = b.dataset.path;
    state.open = state.open === p ? null : p;
    history.replaceState(null, "", state.open ? "#" + encodeURIComponent(state.open) : location.pathname + location.search);
    render();
    if (state.open) document.getElementById(rowId(p))?.scrollIntoView({ block: "nearest" });
  });
  wireDetail();
}

// ---- detail ----------------------------------------------------------------------
function urls(it) {
  const https = `${state.cat.https}/${it.path}`;
  return { https, s3: `${state.cat.s3}/${it.path}`, vsicurl: `/vsicurl/${https}` };
}
function windowBox(it) {
  // a 10 km window at the centre of the data, in MGA zone 55 metres, for the examples
  // around Hobart (MGA55 526000, 5252000) when the data covers it, else the middle of the data
  const b = it.bbox_mga; if (!b || !isMGA(it)) return null;
  const hob = b[0] < 521000 && b[2] > 531000 && b[1] < 5247000 && b[3] > 5257000;
  const cx = hob ? 526000 : Math.round((b[0] + b[2]) / 2 / 1000) * 1000;
  const cy = hob ? 5252000 : Math.round((b[1] + b[3]) / 2 / 1000) * 1000;
  const h = Math.min(5000, Math.max(500, Math.round(Math.min(b[2] - b[0], b[3] - b[1]) / 2 / 500) * 500));
  return [cx - h, cy - h, cx + h, cy + h];
}
function detail(it) {
  const u = urls(it), src = it.source || {};
  const facts = [];
  if (it.kind === "vector") facts.push(["Geometry", esc(it.geometry || "")]);
  if (it.rows != null) facts.push(["Rows", fmtInt(it.rows)]);
  if (it.columns) facts.push(["Columns", fmtInt(it.columns.length)]);
  if (it.raster) {
    const r = it.raster;
    facts.push(["Grid", `${fmtInt(r.dim[0])} × ${fmtInt(r.dim[1])} px, ${r.bands} band${r.bands > 1 ? "s" : ""}`]);
    facts.push(["Cell size", `${+r.res[0].toPrecision(6)} × ${+r.res[1].toPrecision(6)}`]);
    facts.push(["Type", `${esc(r.dtype)}${r.nodata != null ? `, nodata ${esc(r.nodata)}` : ""}`]);
  }
  if (it.kind !== "table") facts.push(["CRS", esc(it.crs || "not set")]);
  if (it.bbox) facts.push(["Extent", `<span class="mono">${it.bbox.map((v) => +(+v).toFixed(4)).join(", ")}</span>`]);
  facts.push(["Size", fmtBytes(it.bytes)]);
  facts.push(["Source", src.kind === "lga"
    ? `built from ${src.n} per-LGA zips (newest released ${esc(src.released)})`
    : `LIST statewide zip, released ${esc(src.released || "?")}`]);
  if (src.built) facts.push(["Converted", esc(src.built.slice(0, 10))]);
  const sp = state.stac[it.path.split("/")[1]];
  if (sp) {
    const u = new URL("stac/" + sp, location.href);
    facts.push(["STAC", `<a href="${esc(PORTOLAN + u.host + u.pathname)}">open in the Portolan Browser</a> · <a href="${esc(u.href)}">collection.json</a>`]);
  }
  const zips = (src.zips || []);
  const zipList = zips.length === 1
    ? `<p class="zips-one"><a href="${esc(zips[0].url)}">${esc(zips[0].name)}</a> (${fmtBytes(zips[0].bytes)}, released ${esc(zips[0].released)})</p>`
    : `<details class="more"><summary>${zips.length} source zips</summary><ul class="zips">${zips.map((z) =>
        `<li><a href="${esc(z.url)}">${esc(z.name)}</a> (${fmtBytes(z.bytes)}, ${esc(z.released)})</li>`).join("")}</ul></details>`;
  const cols = it.columns?.length ? `<section><h3>Columns</h3>${it.columns.length > 24
      ? `<details class="more"><summary>Show ${it.columns.length} columns</summary>${colList(it)}</details>` : colList(it)}</section>` : "";
  const cite = `"${it.title}" from theLIST © State of Tasmania`;
  const snips = snippets(it, u);
  return `<div class="detail">
    <div class="detail-top">
      <div>
        <dl class="facts">${facts.map(([k, v]) => `<dt>${k}</dt><dd>${v}</dd>`).join("")}</dl>
        ${it.crs_note ? `<p class="note">${esc(it.crs_note)}</p>` : ""}
      </div>
      ${locator(it)}
    </div>
    <section><h3>Read it in place</h3><div class="urls">
      ${urlRow("HTTPS", u.https)}${urlRow("S3", u.s3)}${urlRow("GDAL", u.vsicurl)}
    </div></section>
    <section><h3>Examples</h3>
      <div class="tabs" role="tablist">${snips.map((s, i) => `<button type="button" role="tab" aria-selected="${i === 0}" data-i="${i}">${esc(s.tool)}</button>`).join("")}</div>
      ${snips.map((s, i) => `<div class="snippet" role="tabpanel" data-i="${i}"${i ? " hidden" : ""}>
        <pre><code>${esc(s.code)}</code></pre><button class="copy" type="button" data-copy="${esc(s.code)}">Copy</button>
        ${s.hint ? `<p class="hint">${esc(s.hint)}</p>` : ""}</div>`).join("")}
    </section>
    ${cols}
    <section><h3>Source</h3>${zipList}</section>
    <section><h3>Attribution</h3><div class="cite"><span>${esc(cite)}</span><button class="copy" type="button" data-copy="${esc(cite)}">Copy</button></div></section>
  </div>`;
}
const urlRow = (label, v) => `<div class="url"><span>${label}</span><code>${esc(v)}</code><button class="copy" type="button" data-copy="${esc(v)}">Copy</button></div>`;
const colList = (it) => `<ul class="cols">${it.columns.map(([n, t]) => `<li><span class="mono">${esc(n)}</span> <span class="t">${esc(t)}</span></li>`).join("")}</ul>`;

function locator(it) {
  const c = state.cat, ob = c.outline_bbox;   // km
  if (!c.outline || !ob) return "";
  const pad = 15, vb = [ob[0] - pad, -ob[3] - pad, ob[2] - ob[0] + 2 * pad, ob[3] - ob[1] + 2 * pad];
  let ext = "";
  const b = it.bbox_mga;
  if (b) {
    const x0 = Math.max(b[0] / 1000, vb[0]), x1 = Math.min(b[2] / 1000, vb[0] + vb[2]);
    const y0 = Math.max(-b[3] / 1000, vb[1]), y1 = Math.min(-b[1] / 1000, vb[1] + vb[3]);
    if (x1 > x0 && y1 > y0) {
      const w = Math.max(x1 - x0, 6), h = Math.max(y1 - y0, 6);
      ext = `<rect class="ext" x="${x0 - (w - (x1 - x0)) / 2}" y="${y0 - (h - (y1 - y0)) / 2}" width="${w}" height="${h}" rx="1"/>`;
    }
  }
  return `<figure style="margin:0"><svg class="locator" viewBox="${vb.join(" ")}" role="img" aria-label="Extent of the data on a map of Tasmania">
      <path class="land" d="${c.outline}"/>${ext}</svg>
      <figcaption class="locator-cap">${b ? "extent" : "extent not available"}</figcaption></figure>`;
}

function wireDetail() {
  const d = $(".row.open .detail"); if (!d) return;
  for (const t of d.querySelectorAll(".tabs button")) t.addEventListener("click", () => {
    for (const x of d.querySelectorAll(".tabs button")) x.setAttribute("aria-selected", String(x === t));
    for (const p of d.querySelectorAll(".snippet")) p.hidden = p.dataset.i !== t.dataset.i;
  });
  for (const b of d.querySelectorAll(".copy")) b.addEventListener("click", async () => {
    try { await navigator.clipboard.writeText(b.dataset.copy); b.textContent = "Copied"; b.classList.add("done"); }
    catch { b.textContent = "Select and copy"; }
    setTimeout(() => { b.textContent = "Copy"; b.classList.remove("done"); }, 1600);
  });
}

// ---- snippets: one tab per tool, each shown where the tool applies -----------------------
function snippets(it, u) {
  const w = windowBox(it);
  const wl = w ? w.join(", ") : null;
  const S3SET = "-- s3:// works too, after: SET s3_region = 'us-west-2'; SET s3_url_style = 'path';";
  const QGIS = (kind) => `Layer > Add Layer > Add ${kind} Layer...
  Source type: Protocol: HTTP(S), cloud, etc.
  Type:        HTTP/HTTPS/FTP
  URI:         ${u.https}

(or paste ${u.vsicurl} as the file name)`;

  if (it.kind === "vector") {
    const bb = "geometry_bbox";
    return [
      { tool: "DuckDB", code: `INSTALL spatial; LOAD spatial;

SELECT * FROM read_parquet('${u.https}') LIMIT 10;
${w ? `
-- features in a 10 km window (MGA zone 55 metres): the bbox column
-- lets DuckDB skip row groups without reading geometry
SELECT count(*) FROM read_parquet('${u.https}')
WHERE ${bb}.xmax > ${w[0]} AND ${bb}.xmin < ${w[2]}
  AND ${bb}.ymax > ${w[1]} AND ${bb}.ymin < ${w[3]};
` : ""}
${S3SET}` },
      { tool: "GDAL", code: `gdal vector info --summary ${u.vsicurl}
${w ? `
# features in a 10 km window, in the layer's CRS
gdal vector filter --bbox ${w.join(",")} ${u.vsicurl} window.gpkg
` : ""}
# the whole layer, to any format GDAL writes
gdal vector convert ${u.vsicurl} ${it.path.split("/").pop().replace(/\.parquet$/, "")}.gpkg

# GDAL before 3.11: ogrinfo -so -al ${u.vsicurl}${w ? `
#                   ogr2ogr -spat ${w.join(" ")} window.gpkg ${u.vsicurl}` : ""}`,
        hint: "Set AWS_NO_SIGN_REQUEST=YES to use /vsis3/ paths instead of /vsicurl/." },
      { tool: "R", code: `library(gdalraster)
v <- new(GDALVector, "${u.vsicurl}")
v$getFeatureCount()
${w ? `v$setSpatialFilterRect(c(${wl}))   # 10 km window, MGA zone 55
` : ""}d <- v$fetch(-1)   # data frame, geometry as WKB
v$close()

# or with sf
x <- sf::read_sf("${u.vsicurl}")` },
      { tool: "Python", code: `import geopandas as gpd

${w ? `# 10 km window (MGA zone 55); GeoPandas >= 1.0 uses the bbox column
gdf = gpd.read_parquet("${u.https}", bbox=(${wl}))
` : ""}gdf = gpd.read_parquet("${u.https}")

# or through GDAL (pyogrio)
gdf = gpd.read_file("${u.vsicurl}"${w ? `, bbox=(${wl})` : ""})`,
        hint: "read_parquet over HTTPS needs fsspec and aiohttp installed." },
      { tool: "QGIS", code: QGIS("Vector") },
    ];
  }
  if (it.kind === "raster") {
    const [nx, ny] = it.raster?.dim || [1, 1];
    const oy = Math.max(1, Math.round(800 * ny / nx));
    return [
      { tool: "GDAL", code: `gdal raster info ${u.vsicurl}
${w ? `
# a 10 km window, in the raster's CRS
gdal raster clip --bbox ${w.join(",")} ${u.vsicurl} window.tif
` : ""}
# GDAL before 3.11: gdalinfo ${u.vsicurl}${w ? `
#   gdal_translate -projwin ${w[0]} ${w[3]} ${w[2]} ${w[1]} ${u.vsicurl} window.tif` : ""}`,
        hint: "Set AWS_NO_SIGN_REQUEST=YES to use /vsis3/ paths instead of /vsicurl/." },
      { tool: "R", code: `library(gdalraster)
r <- new(GDALRaster, "${u.vsicurl}")
r$dim(); r$res(); r$bbox()
# the whole grid at 800 px wide, served from the overviews
v <- read_ds(r, out_xsize = 800, out_ysize = ${oy})
r$close()

# or with terra
x <- terra::rast("${u.vsicurl}")${w ? `
terra::crop(x, terra::ext(${w[0]}, ${w[2]}, ${w[1]}, ${w[3]}))` : ""}` },
      { tool: "Python", code: `import rasterio
${w ? "from rasterio.windows import from_bounds\n" : ""}
with rasterio.open("${u.https}") as src:
    print(src.profile)
${w ? `    a = src.read(1, window=from_bounds(${wl}, src.transform))
` : ""}    small = src.read(1, out_shape=(${oy}, 800))   # read from an overview

# or with xarray
import rioxarray
da = rioxarray.open_rasterio("${u.https}", overview_level=2)` },
      { tool: "QGIS", code: QGIS("Raster") },
    ];
  }
  return [
    { tool: "DuckDB", code: `SELECT * FROM read_parquet('${u.https}') LIMIT 10;
DESCRIBE SELECT * FROM read_parquet('${u.https}');

${S3SET}` },
    { tool: "GDAL", code: `gdal vector info ${u.vsicurl}
gdal vector convert ${u.vsicurl} ${it.path.split("/").pop().replace(/\.parquet$/, "")}.csv

# GDAL before 3.11: ogrinfo -al -so ${u.vsicurl}` },
    { tool: "R", code: `library(duckdb)
con <- dbConnect(duckdb())
d <- dbGetQuery(con, "SELECT * FROM read_parquet('${u.https}')")

# or through GDAL
library(gdalraster)
v <- new(GDALVector, "${u.vsicurl}")
d <- v$fetch(-1)` },
    { tool: "Python", code: `import pandas as pd
df = pd.read_parquet("${u.https}")   # needs fsspec and aiohttp

# or with polars, which reads HTTPS directly
import polars as pl
df = pl.read_parquet("${u.https}")` },
    { tool: "QGIS", code: QGIS("Vector") },
  ];
}

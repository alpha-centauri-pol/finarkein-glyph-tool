# Finarkein · Glyph Tool

Turn any **image or video** into a grid of glyphs (circle / cross / square) driven by
**relative brightness** — an interactive web port of the `course_08.pde` Processing sketch.

Live preview, full slider control, and **PNG / SVG / WebM** export. Single static
`index.html`, no build step, no dependencies.

## How it works

For each tile in an `N×N` grid the tool samples brightness, then maps it **relative to the
frame's own min/max brightness** across `0–100` (`map(b, minB, maxB, 0, 100)`, exactly like
the original sketch). Whichever band's range contains that value decides which glyph is drawn.

## Defaults (straight from the sketch)

| Control | Default | Source in `course_08.pde` |
| --- | --- | --- |
| Tiles | `72` | `tilesX = 72` |
| Output size | `1080` | `size(1080, 1080)` |
| Background | `#FFFCF5` | `bg = #FFFCF5` |
| Sampling | top-left pixel | `img.get(x*tileSize, y*tileSize)` |
| Brightness | `max(R,G,B)` | Processing `brightness()` |
| Relative mapping | on | `map(b, minB, maxB, 0, 100)` |
| cross band | `0–25`, `#65B75A` | first `if` |
| square band | `25–45`, `#6ED0E0` | second `else if` |
| circle band | `50–100`, `#D8FF5B` | third `else if` |

> The 45–50 gap from the original `if/else` chain is preserved, so some tiles stay empty.
> Adjust the band sliders to close it.

## Controls

- **Source** — load an image/video, drag-and-drop, or use the built-in demo.
- **Grid** — tile count, output size, glyph scale, fit (stretch vs cover/crop).
- **Sampling & mapping** — sample mode (top-left / center / average), brightness mode
  (`max(R,G,B)` vs perceptual luma), relative-mapping toggle, invert.
- **Background** — color.
- **Bands** — per band: enable, glyph, color, from/to brightness range. Randomize colors.
- **Export** — PNG, SVG (real vector paths), and full-clip WebM render.

## Run locally

Just open `index.html` in a browser — or serve it:

```bash
npx serve .
```

Load files via the button or drag-and-drop (this keeps the canvas untainted so export works).

## Deploy

Static site — deploys as-is on Vercel (`vercel`) or any static host.

---

Built from the `course_08` Processing sketch.

# TESTING — feasible-region

Manual verification checklist. Automated coverage is the compile-only battery in
`tests/regression.typ`; this file is for the things a human should eyeball.

Render the battery with:

```sh
typst compile --root . tests/regression.typ tests/regression.pdf
```

Then check, page by page:

- [ ] **Bounded, unique optimum** — region filled + hatched; optimum highlighted
  at `C(3,1)`; table shows `Z = 13` in the marked row.
- [ ] **Unbounded, finite minimum** — open sides carry outward arrows; "unbounded
  region" note appears; optimum `Z = 8` at `A(4,0)`; `∇Z` points **away** from
  the feasible region (flipped for `sense: "min"`, since the gradient itself
  points toward increasing `Z`).
- [ ] **Unbounded objective** — no vertex is marked optimal; message "No finite
  max: Z increases without bound…".
- [ ] **Multiple optima (segment)** — thick segment `C(3,1)–D(0,4)`; message
  "Multiple solution: Z = 4 on the entire segment …".
- [ ] **Multiple optima (ray)** — thick ray from the optimal vertex with an
  arrowhead; message mentions "on the entire ray starting at …".
- [ ] **Any quadrant** (`first-quadrant: false`) — axes cross inside the frame;
  ticks show negatives; `∇Z` points perpendicular to the level lines.
- [ ] **Strict inequality** — boundary drawn **dashed**.
- [ ] **Infeasible system** — no table; message "Infeasible region".
- [ ] **Localization** — the same call with `lang: "es"` renders every label in
  Spanish (Vértice / Coordenadas / Óptimo / Solución múltiple / Región no factible).
- [ ] **Gradient direction** — `∇Z` is visually perpendicular to the optimal
  level line, both in the first quadrant and with negative coordinates.
- [ ] **`equal-aspect: false`** — on a case with a non-square data range (e.g.
  case 1 or 2 above), pass `equal-aspect: false`: the figure stretches to fill
  `size` exactly, each axis picks its own tick step again, and `∇Z` is still
  visually perpendicular to the level line.
- [ ] **Vertex label placement** — on a many-vertex region (e.g. the "many
  constraints" case), letters lean away from the polygon (exterior bisector)
  instead of a fixed corner offset; check none sits on top of an edge.

## Gallery

- [ ] `gallery/g1.png … g4.png` match the current output after any code change:
  `typst compile --root . --format png --ppi 150 gallery/examples.typ gallery/g{p}.png`

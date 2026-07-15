# ROADMAP — feasible-region

Known issues and pending decisions. Nothing here blocks ordinary use; the two
"semantic" items only arise with inputs that do not appear in textbook problems.

## Known limitations

### Semantic (rare edge cases — documented on purpose, not fixed)

- **A strict inequality binding the optimum.** With e.g. `x + y > 2` (strict)
  and a minimization whose optimum lies on that boundary, the plot labels the
  segment/ray as an attained optimum. Strictly, the boundary is *open*, so the
  value is an **infimum that is not attained** — there is no minimum. The package
  normalizes strict operators to non-strict for the geometry (drawing a dashed
  boundary to signal non-membership), so the table text overclaims here.
  *Why unfixed:* strict inequalities binding the optimum do not occur in
  school-level LP; a correct fix needs "infimum not attained" logic.

- **More than two vertices tied in `Z`.** The multiple-optimum highlight draws a
  segment from the first to the last tied vertex. When three or more vertices tie
  and they do not form a single edge (e.g. a degenerate objective like `(0, 0)`,
  where every vertex ties), that segment misrepresents the true optimal set.
  *Why unfixed:* only reachable with pathological objectives or collinear-in-`Z`
  vertices; a fix needs edge-collinearity detection.

### Cosmetic

- **Vertex label overlaps** when two vertices are very close (fixed offset, no
  anti-collision).
- **Zero-area regions** (a single point or a segment) are drawn, but without
  hatching (the hatch loop has nothing to traverse).
- The **sliding level lines** are schematic (they illustrate the sweep; they are
  not a metric scale).

## Possible improvements (Phase 4, optional)

- Anti-collision placement for vertex labels.
- Hatching (or a clearer mark) for degenerate zero-area regions.
- More localization languages in `_i18n` (currently `en`, `es`).
- A minimal reference-image test setup (e.g. `tytanic`) beyond the compile-only
  regression file in `tests/`.

## Before publishing to Typst Universe

- [x] Confirm the name `feasible-region` is free in the index.
- [ ] Final visual pass on the gallery images.
- [x] Submit a PR to `typst/packages` (`packages/preview/quick-vertex/0.1.0/`, renamed from `feasible-region` per reviewer feedback).

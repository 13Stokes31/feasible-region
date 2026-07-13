// Regression battery for feasible-region.
// Compile-only check: `typst compile --root .. tests/regression.typ out.pdf`
// must succeed and each page must match the expected result in the comment.
#import "../lib.typ": feasible-region
#set page(width: auto, height: auto, margin: 1cm)
#set text(9pt)

// -- canonical cases --------------------------------------------------------

// 1. bounded + unique optimum       → Z = 13 at (3,1)
#feasible-region(((1,1,4,"<="),(1,3,6,"<=")), objective: (3,4), sense: "max")
#pagebreak()

// 2. unbounded + finite minimum     → Z = 8 at (4,0)
#feasible-region(((1,1,4,">="),(1,0,1,">=")), objective: (2,3), sense: "min")
#pagebreak()

// 3. unbounded objective            → "no finite maximum"
#feasible-region(((1,1,4,">="),(1,0,1,">=")), objective: (1,1), sense: "max")
#pagebreak()

// 4. multiple optima (segment)      → Z = 4 on the segment (0,4)–(3,1)
#feasible-region(((1,1,4,"<="),(1,0,3,"<=")), objective: (1,1), sense: "max")
#pagebreak()

// 5. multiple optima (ray)          → Z = 1 on the ray from (0,1) along +x
#feasible-region(((0,1,1,">="),), objective: (0,1), sense: "min")
#pagebreak()

// 6. outside the first quadrant     → Z = 5 at (1,2)
#feasible-region(
  ((1,0,3,"<="),(1,0,-2,">="),(0,1,2,"<="),(0,1,-1,">="),(1,1,3,"<=")),
  objective: (1,2), sense: "max", first-quadrant: false,
)
#pagebreak()

// 7. strict inequality              → triangle (0,0),(4,0),(0,4), dashed boundary
#feasible-region(((1,1,4,"<"),))
#pagebreak()

// 8. incompatible system            → "Infeasible region"
#feasible-region(((1,0,5,">="),(1,0,3,"<=")))
#pagebreak()

// 9. localization (Spanish)         → same as (1), labels in Spanish
#feasible-region(((1,1,4,"<="),(1,3,6,"<=")), objective: (3,4), sense: "max", lang: "es")

// -- degenerate / adversarial (must not panic) ------------------------------
#pagebreak()
// point region
#feasible-region(((1,0,2,"<="),(1,0,2,">="),(0,1,2,"<="),(0,1,2,">=")), objective: (1,1))
#pagebreak()
// duplicate + always-true constraints
#feasible-region(((1,1,4,"<="),(1,1,4,"<="),(0,0,5,"<=")), objective: (1,1), sense: "max")

#import "utils.typ": make-doc-heading, make-doc-list, make-doc-page, make-doc-par, make-doc-text, make-heading, make-scale, make-text
#import "@preview/fontawesome:0.5.0": fa-envelope, fa-github, fa-linkedin, fa-location-dot, fa-mobile-screen-button
#import "style/scale.typ": size-body, size-h3, size-h4, space-paragraph, leading-body, margin-inner, margin-outer, margin-top, margin-bottom

#let doc-defaults = (
  text: (font: "EB Garamond", size: 12pt, tracking: 1pt, weight: 500),
  page: (paper: "us-letter", margin: (left: 1in, top: 0.75in, right: 1in, bottom: 1in)),
  par: (justify: true),
  list: (tight: true),
)

#let scale-defaults = (
  ratio: 1.25,
  lead-base: 0.57,
  lead-slope: 0.19,
  tracking-offset: 0.09em,
  tracking-slope: 0.05,
)

#let color-defaults = (
  color-0: rgb("#16161D"),
  color-1: rgb("#6C757D"),
  color-2: rgb("#A2A2A5"),
)

#let make-layout(s, c) = (
  h1: (
    size: (s.size)(3),
    tracking: (s.tracking)(3),
    fill: c.color-0,
    weight: "bold",
    smallcaps: true,
    numbering: none,
    above: 0pt,
    below: (s.leading)(0),
  ),
  h2: (
    size: (s.size)(2),
    tracking: (s.tracking)(2),
    fill: c.color-0,
    weight: "bold",
    smallcaps: true,
    numbering: none,
    above: (s.size)(0) + (s.leading)(0),
    below: (s.leading)(2),
  ),
  h3: (
    size: (s.size)(1),
    tracking: (s.tracking)(1),
    fill: c.color-0,
    weight: "bold",
    smallcaps: true,
    numbering: none,
    above: (s.size)(0) + (s.leading)(0),
    below: (s.leading)(1),
  ),
  text-5: (size: (s.size)(2),  tracking: (s.tracking)(2),  fill: c.color-0, weight: "regular", leading: (s.leading)(2)),
  text-4: (size: (s.size)(1),  tracking: (s.tracking)(1),  fill: c.color-0, weight: "regular", leading: (s.leading)(1)),
  text-3: (size: (s.size)(0),  tracking: (s.tracking)(0),  fill: c.color-0, weight: "regular", leading: (s.leading)(0)),
  text-2: (size: (s.size)(-1), tracking: (s.tracking)(-1), fill: c.color-0, weight: "regular", leading: (s.leading)(-1)),
  text-1: (size: (s.size)(-2), tracking: (s.tracking)(-2), fill: c.color-0, weight: "regular", leading: (s.leading)(-2)),
)

// scale: overrides are merged with scale-defaults. All token sizes, leading, and
// tracking derive from the resulting scale — change one value, everything moves.
// layout: and doc: overrides replace the full token dict for that key.
#let set-style(
  colors: (:),
  layout: (:),
  doc: (:),
  scale: (:),
) = {
  let sc = scale-defaults + scale
  let s = make-scale(
    ratio: sc.ratio,
    lead-base: sc.lead-base,
    lead-slope: sc.lead-slope,
    tracking-offset: sc.tracking-offset,
    tracking-slope: sc.tracking-slope,
  )
  let base-leading = (s.leading)(0)
  let base-size    = (s.size)(0)
  let c = color-defaults + colors
  let l = make-layout(s, c) + layout
  let d = doc-defaults + doc
  // par.spacing = one full typographic line (font size + leading) — the standard
  // "blank line" between paragraphs. list.spacing = one inter-line space (tighter).
  let par-cfg  = (spacing: base-size + base-leading, leading: base-leading) + d.par
  let list-cfg = (spacing: base-leading,             leading: base-leading) + d.list
  let g = (colors: c, layout: l, doc: (text: d.text, page: d.page, par: par-cfg, list: list-cfg, heading: (h1: l.h1, h2: l.h2, h3: l.h3)))
  let h1 = make-heading(g.layout.h1, 1)
  let h2 = make-heading(g.layout.h2, 2)
  let h3 = make-heading(g.layout.h3, 3)
  let t1 = make-text(g.layout.text-1)
  let t2 = make-text(g.layout.text-2)
  let t3 = make-text(g.layout.text-3)
  let t4 = make-text(g.layout.text-4)
  let t5 = make-text(g.layout.text-5)
  let base = t3
  (
    global: g,
    doc: (
      text: make-doc-text((fill: g.colors.color-0) + g.doc.text),
      page: make-doc-page(g.doc.page),
      par: make-doc-par(g.doc.par),
      list: make-doc-list(g.doc.list),
      heading: make-doc-heading(g.doc.heading.h1, g.doc.heading.h2, g.doc.heading.h3),
    ),
    layout: (
      // Colors
      color-0: g.colors.color-0,
      color-1: g.colors.color-1,
      color-2: g.colors.color-2,
      // Scale tokens
      h1: h1,
      h2: h2,
      h3: h3,
      text-5: t5,
      text-4: t4,
      text-3: t3,
      text-2: t2,
      text-1: t1,
      icons: (
        font: "Font Awesome 7 Free Solid",
        envelope: fa-envelope,
        github: fa-github,
        linkedin: fa-linkedin,
        location: fa-location-dot,
        phone: fa-mobile-screen-button,
      ),
      dot-divider: (..ov) => text(
        sym.circle.filled,
        fill: ov.named().at("fill", default: g.colors.color-2),
      ),
      // Compositional wrappers
      // par: body text, defaults to base. Pass named overrides for adjustments.
      par: (body, ..ov) => base(body, ..ov),
      // heading: level-dispatch, no default. (style.heading)(2)[text]
      heading: (level, body, ..ov) => (h1: h1, h2: h2, h3: h3).at("h" + str(level))(body, ..ov),
      // text: level-dispatch, no default. (style.text)(3)[content]
      text: (level, body, ..ov) => ("text-1": t1, "text-2": t2, "text-3": t3, "text-4": t4, "text-5": t5).at(
        "text-" + str(level),
      )(body, ..ov),
      // list: renders an array of items as a styled list, base text by default.
      list: (items, ..ov) => {
        let b = g.layout.text-3 + ov.named()
        set text(size: b.size, tracking: b.tracking, weight: b.weight)
        for item in items [
          - #base(..ov.named())[#item]
        ]
      },
    ),
  )
}

#let stylesheet = (
  us: set-style(
    doc: (
      text: (font: "Apple Garamond", size: size-body, tracking: 0pt, weight: 400),
      page: (paper: "us-letter", margin: (left: margin-inner, right: margin-outer, top: margin-top, bottom: margin-bottom)),
      par: (first-line-indent: 0pt, justify: false, spacing: leading-body * 0.5, leading: leading-body),
    ),
    layout: (
      h2: (size: size-h3, tracking: 0pt, fill: color-defaults.color-0, weight: "bold", smallcaps: true,  numbering: none, above: space-paragraph,     below: leading-body * 0.25),
      h3: (size: size-h4, tracking: 0pt, fill: color-defaults.color-0, weight: "bold", smallcaps: false, numbering: none, above: leading-body * 0.75, below: 0pt),
    ),
  ),
  cv: set-style(
    colors: (color-0: rgb("#A2A2A5")),
    doc: (
      text: (font: "Source Serif 4", size: 24pt, tracking: 1pt, weight: 500),
      page: (paper: "a4", margin: (top: 1cm)),
    ),
  ),
)

#let get-style(region) = stylesheet.at(region)

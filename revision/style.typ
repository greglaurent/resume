#import "utils.typ": make-doc-list, make-doc-page, make-doc-par, make-doc-text, make-heading, make-text

#let color-defaults = (
  primary: rgb("#16161D"),
  secondary: rgb("#6C757D"),
  accent: rgb("#A2A2A5"),
)

#let layout-defaults = (
  h1: (size: 2em, tracking: 1pt, weight: "bold", smallcaps: true, numbering: none, above: 0pt, below: 0.25em),
  h2: (size: 1.2em, tracking: 1pt, weight: "bold", smallcaps: true, numbering: none, above: 1em, below: 1em),
  h3: (size: 1.1em, tracking: 0.5pt, weight: "bold", smallcaps: true, numbering: none, above: 0.5em, below: 0.5em),
  subtitle: (size: 1.2em, tracking: 0.75pt, weight: "regular", smallcaps: true),
  contact: (size: 1em, tracking: 0.5pt, weight: "regular", smallcaps: false),
  body: (size: 1em, leading: 1em, tracking: 0.5pt, weight: "regular"),
  caption: (size: 1em, tracking: 0.5pt, weight: "regular", smallcaps: false),
  bullet: (size: 0.9em, tracking: 0.5pt, weight: "regular"),
)

#let doc-defaults = (
  text: (font: "EB Garamond", size: 12pt, tracking: 1pt, weight: 500),
  page: (paper: "us-letter", margin: (left: 1in, top: 0.75in, right: 1in, bottom: 1in)),
  par: (spacing: 1em, leading: 1em, justify: true),
  list: (tight: true, leading: 0.5em, spacing: 0.5em),
)

// Note: all three override params are partial dicts merged with their *-defaults counterparts.
// Sub-dict overrides are total replacements — e.g. passing doc: (page: (paper: "a4")) drops all
// other doc-defaults.page fields. Callers must restate any fields they want to preserve.
#let set-style(
  colors: (:),
  layout: (:),
  doc: (:),
) = {
  let c = color-defaults + colors
  let l = layout-defaults + layout
  let d = doc-defaults + doc
  let g = (colors: c, layout: l, doc: d)
  (
    global: g,
    doc: (
      // fill is injected from colors.primary so it is never hardcoded in doc.text tokens.
      text: make-doc-text((fill: g.colors.primary) + g.doc.text),
      page: make-doc-page(g.doc.page),
      par: make-doc-par(g.doc.par),
      list: make-doc-list(g.doc.list),
    ),
    layout: (
      h1: make-heading(g.layout.h1, 1),
      h2: make-heading(g.layout.h2, 2),
      h3: make-heading(g.layout.h3, 3),
      subtitle: make-text(g.layout.subtitle),
      contact: make-text(g.layout.contact),
      body: make-text(g.layout.body),
      caption: make-text(g.layout.caption),
      dot-divider: (..ov) => text(
        sym.circle.filled,
        fill: ov.named().at("fill", default: g.colors.accent),
      ),
    ),
  )
}

#let stylesheet = (
  us: set-style(),
  cv: set-style(
    colors: (primary: rgb("#A2A2A5")),
    doc: (
      text: (font: "Source Serif 4", size: 24pt, tracking: 1pt, weight: 500),
      page: (paper: "a4", margin: (top: 1cm)),
    ),
  ),
)

#let get-style(region) = stylesheet.at(region)

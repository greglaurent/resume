#import "utils.typ": make-doc-heading, make-doc-list, make-doc-page, make-doc-par, make-doc-text, make-heading, make-text
#import "@preview/fontawesome:0.5.0": fa-envelope, fa-github, fa-linkedin, fa-location-dot, fa-mobile-screen-button
#import "style/scale.typ" as scale
#import "style/scale.typ": *

#let color-defaults = (
  color-0: rgb("#16161D"),
  color-1: rgb("#6C757D"),
  color-2: rgb("#A2A2A5"),
)

#let doc-defaults = (
  text: (font: "EB Garamond", size: size-body, tracking: tracking-body, weight: 400, hyphenate: hyphenation-enabled),
  page: (paper: default-paper),
  par:  (justify: true),
  list: (tight: true),
)

// Look up cap-em for the body font; fall back to default if the font isn't
// in the registry. Add new fonts to scale.cap-em as needed.
#let _resolve-cap-em(font) = if font in scale.cap-em { scale.cap-em.at(font) } else { scale.default-cap-em }

#let _make-leading(cap-em) = (
  body:  scale.leading-body-for(cap-em),
  tight: scale.leading-tight-for(cap-em),
  loose: scale.leading-loose-for(cap-em),
)

#let _make-spacing(cap-em) = (
  paragraph:        scale.space-paragraph-for(cap-em),
  block:            scale.space-block-for(cap-em),
  list-item:        scale.space-list-item-for(cap-em),
  list-above:       scale.space-list-above-for(cap-em),
  list-below:       scale.space-list-below-for(cap-em),
  caption-gap:      scale.space-caption-gap-for(cap-em),
  heading-above:    scale.space-heading-above-for(cap-em),
  heading-below:    scale.space-heading-below-for(cap-em),
  subheading-above: scale.space-subheading-above-for(cap-em),
  subheading-below: scale.space-subheading-below-for(cap-em),
  section-above:    scale.space-section-above-for(cap-em),
  section-below:    scale.space-section-below-for(cap-em),
)

// Token table: each entry is a typography cfg dict consumed by make-text/make-heading.
// Sizes and trackings come from scale.typ named roles. Leading and block spacing
// are per-region — they depend on the body font's cap-em.
#let make-layout(c, leading, spacing) = (
  h1: (size: size-h1, tracking: tracking-h1, fill: c.color-0, weight: "bold", smallcaps: true, numbering: none, above: spacing.heading-above, below: spacing.heading-below, leading: leading.tight),
  h2: (size: size-h2, tracking: tracking-h2, fill: c.color-0, weight: "bold", smallcaps: true, numbering: none, above: spacing.heading-above, below: spacing.heading-below, leading: leading.tight),
  h3: (size: size-h3, tracking: tracking-h3, fill: c.color-0, weight: "bold", smallcaps: true, numbering: none, above: spacing.heading-above, below: spacing.heading-below, leading: leading.body),
  text-5: (size: size-h3,      tracking: tracking-h3,      fill: c.color-0, weight: "regular", leading: leading.body),
  text-4: (size: size-h4,      tracking: tracking-h4,      fill: c.color-0, weight: "regular", leading: leading.body),
  text-3: (size: size-body,    tracking: tracking-body,    fill: c.color-0, weight: "regular", leading: leading.body),
  text-2: (size: size-small,   tracking: tracking-small,   fill: c.color-0, weight: "regular", leading: leading.loose),
  text-1: (size: size-caption, tracking: tracking-caption, fill: c.color-0, weight: "regular", leading: leading.loose),
)

// colors:, doc:, layout: are override dicts merged onto defaults.
// Leading and block spacing resolve per-region from the body font's cap-em
// (registry in scale.typ) — exposed via style.global.leading and style.global.spacing.
#let set-style(colors: (:), layout: (:), doc: (:), measure: scale.measure-target, margin-style: "single") = {
  let c = color-defaults + colors
  let d = doc-defaults + doc
  let cap-em-here = _resolve-cap-em(d.text.font)
  let leading = _make-leading(cap-em-here)
  let spacing = _make-spacing(cap-em-here)
  let par-cfg  = (leading: leading.body, spacing: spacing.paragraph) + d.par
  let list-cfg = (leading: leading.body, spacing: spacing.paragraph) + d.list
  // Resolve paper-aware margins (spec Section G). Per-edge user override wins.
  let paper = d.page.paper
  let m = scale.margins-for(paper, d.text.font, measure: measure, margin-style: margin-style)
  let computed-margin = (left: m.inner, right: m.outer, top: m.top, bottom: m.bottom)
  let user-margin = d.page.at("margin", default: (:))
  let page-cfg = (paper: paper, margin: computed-margin + user-margin)
  let l = make-layout(c, leading, spacing) + layout
  let g = (
    colors: c,
    layout: l,
    leading: leading,
    spacing: spacing,
    cap-em:  cap-em-here,
    margins: m,
    doc: (text: d.text, page: page-cfg, par: par-cfg, list: list-cfg, heading: (h1: l.h1, h2: l.h2, h3: l.h3)),
  )
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
      text:    make-doc-text((fill: g.colors.color-0) + g.doc.text),
      page:    make-doc-page(g.doc.page),
      par:     make-doc-par(g.doc.par),
      list:    make-doc-list(g.doc.list),
      heading: make-doc-heading(g.doc.heading.h1, g.doc.heading.h2, g.doc.heading.h3),
    ),
    layout: (
      color-0: g.colors.color-0,
      color-1: g.colors.color-1,
      color-2: g.colors.color-2,
      h1: h1, h2: h2, h3: h3,
      text-5: t5, text-4: t4, text-3: t3, text-2: t2, text-1: t1,
      icons: (
        font: "Font Awesome 7 Free Solid",
        envelope: fa-envelope,
        github: fa-github,
        linkedin: fa-linkedin,
        location: fa-location-dot,
        phone: fa-mobile-screen-button,
      ),
      dot-divider: (..ov) => text(sym.circle.filled, fill: ov.named().at("fill", default: g.colors.color-2)),
      par:     (body, ..ov)        => base(body, ..ov),
      heading: (level, body, ..ov) => (h1: h1, h2: h2, h3: h3).at("h" + str(level))(body, ..ov),
      text:    (level, body, ..ov) => ("text-1": t1, "text-2": t2, "text-3": t3, "text-4": t4, "text-5": t5).at("text-" + str(level))(body, ..ov),
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
    measure: 90,  // tight (resume); spec default is 66 (book canon)
    doc: (
      par: (first-line-indent: 0pt, justify: false),
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

#import "utils.typ": set-heading, style-text

#let make-masthead(global) = (
  heading: (body, ..overrides) => {
    let cfg = global.heading_1 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 1))
  },
  subtitle: (body, ..overrides) => style-text(body, global.subtitle + overrides.named()),
  contact: (body, ..overrides) => style-text(body, global.contact + overrides.named()),
  dot-divider: text(sym.circle.filled, fill: global.color-2),
)

#let make-summary(global) = (
  body: (body, ..overrides) => style-text(body, global.summary + overrides.named()),
)

#let make-experience(global) = (
  heading: (body, ..overrides) => {
    let cfg = global.heading_2 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 2))
  },
  subheading: (body, ..overrides) => {
    let cfg = global.heading_3 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 3))
  },
  caption: (body, ..overrides) => style-text(body, global.caption + overrides.named()),
  dates: (body, ..overrides) => style-text(body, global.heading_3 + overrides.named()),
  summary: (body, ..overrides) => block(
    below: 1em,
    par(leading: 0.5em, emph(style-text(body, global.body + (size: 0.9em) + overrides.named()))),
  ),
)

#let make-education(global) = (
  heading: (body, ..overrides) => {
    let cfg = global.heading_2 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 2))
  },
  subheading: (body, ..overrides) => {
    let cfg = global.heading_3 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 3))
  },
)

#let make-solution-driven(global) = (
  heading: (body, ..overrides) => {
    let cfg = global.heading_2 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 2))
  },
)

#let make-holistic-approach(global) = (
  heading: (body, ..overrides) => {
    let cfg = global.heading_2 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 2))
  },
)

#let make-clearance(global) = (
  heading: (body, ..overrides) => {
    let cfg = global.heading_2 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 2))
  },
  subheading: (body, ..overrides) => {
    let cfg = global.heading_3 + overrides.named()
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), 3))
  },
)

#let set-style(
  font: "EB Garamond",
  color-0: rgb("#16161D"),
  color-1: rgb("#6C757D"),
  color-2: rgb("#A2A2A5"),
  heading_1: (size: 2em, tracking: 1pt, weight: "regular", smallcaps: true, numbering: none, above: 0pt, below: 0.25em),
  heading_2: (
    size: 1.2em,
    tracking: 1pt,
    weight: "bold",
    smallcaps: true,
    numbering: none,
    above: 1em,
    below: 1em,
  ),
  heading_3: (
    size: 1.1em,
    tracking: 0.5pt,
    weight: "bold",
    smallcaps: true,
    numbering: none,
    above: 0.5em,
    below: 0.5em,
  ),
  subtitle: (size: 1.1em, tracking: 1pt, weight: "regular", smallcaps: true),
  contact: (size: 1em, tracking: 0.5pt, weight: "regular", smallcaps: true),
  body: (size: 1em, tracking: 1pt, weight: "regular"),
  summary: (size: 1em, tracking: 0pt, weight: "regular", smallcaps: false),
  caption: (size: 1em, tracking: 0.5pt, weight: "regular", smallcaps: false),
  bullet: (size: 0.9em, tracking: 0.5pt, weight: "regular"),
  list: (tight: true, leading: 0.5em, spacing: 0.5em),
) = {
  let global = (
    font: font,
    color-0: color-0,
    color-1: color-1,
    color-2: color-2,
    heading_1: heading_1,
    heading_2: heading_2,
    heading_3: heading_3,
    subtitle: subtitle,
    contact: contact,
    body: body,
    summary: summary,
    caption: caption,
    bullet: bullet,
    list: list,
  )
  (
    global: global,
    masthead: make-masthead(global),
    summary: make-summary(global),
    experience: make-experience(global),
    education: make-education(global),
    solution-driven: make-solution-driven(global),
    holistic-approach: make-holistic-approach(global),
    clearance: make-clearance(global),
  )
}

#let stylesheet = (
  us: set-style(),
  cv: set-style(font: "Source Serif 4"),
)

#let get-style(region) = stylesheet.at(region)

// Modular type scale. Returns (size, leading, tracking) functions keyed by integer step.
// size(0) = 1em, size(n) = ratio^n * 1em.
// leading(n) = size(n) × (lead-base - lead-slope × ratio^n) — inversely proportional
//   to text size per typographic standards: ~120% for large headings, ~138% for body
//   text, ~145% for small text. Mirrors the tracking formula.
// tracking(n) = tracking-offset - tracking-slope × size(n) — inversely proportional
//   to the exact computed size so larger type gets tighter tracking automatically.
#let make-scale(
  ratio: 1.25,
  lead-base: 0.57,
  lead-slope: 0.19,
  tracking-offset: 0.09em,
  tracking-slope: 0.05,
) = {
  let sz(n) = calc.pow(ratio, n) * 1em
  (
    size:     sz,
    leading:  n => sz(n) * (lead-base - lead-slope * calc.pow(ratio, n)),
    tracking: n => tracking-offset - tracking-slope * sz(n),
  )
}

#let set-heading(body, level, numbering: none) = heading(level: level, numbering: numbering, body)

#let style-text(body, cfg) = {
  set text(
    size: cfg.size,
    tracking: cfg.tracking,
    weight: cfg.weight,
    ..if "font" in cfg { (font: cfg.font) } else { (:) },
    ..if "fill" in cfg { (fill: cfg.fill) } else { (:) },
  )
  let result = if cfg.at("smallcaps", default: false) { smallcaps(body) } else { body }
  let result = if cfg.at("emph", default: false) { emph(result) } else { result }
  if "leading" in cfg { { set par(leading: cfg.leading); result } } else { result }
}

// Typography callable factory
#let make-text(token) = (body, ..ov) => {
  let cfg = token + ov.named()
  let content = style-text(body, cfg)
  if "above" in cfg { v(cfg.above, weak: true) }
  content
  if "below" in cfg { v(cfg.below, weak: true) }
}

// Block-level styled element — no Typst heading() node.
// All styling and spacing owned by the token; no show rules required.
#let make-block-heading(token) = (body, ..ov) => {
  let cfg = token + ov.named()
  if "above" in cfg { v(cfg.above, weak: true) }
  style-text(body, cfg)
  if "below" in cfg { v(cfg.below, weak: true) }
}

#let make-heading(token, level) = (body, ..ov) => {
  let cfg = token + ov.named()
  set-heading(style-text(body, cfg), level, numbering: cfg.numbering)
}

// Sets heading block spacing at document level — must be applied once in doc setup.
// show rules inside closures don't propagate to the layout scope; this factory
// registers them where they are guaranteed to apply.
#let make-doc-heading(h1, h2, h3) = (c) => {
  show heading.where(level: 1): set block(above: h1.above, below: h1.below)
  show heading.where(level: 2): set block(above: h2.above, below: h2.below)
  show heading.where(level: 3): set block(above: h3.above, below: h3.below)
  c
}

// Document rule callable factories
#let make-doc-text(base) = (c, ..ov) => {
  let cfg = base + ov.named()
  set text(..cfg)
  c
}

#let make-doc-page(base) = (c, ..ov) => {
  let cfg = base + ov.named()
  set page(..cfg)
  c
}

#let make-doc-par(base) = (c, ..ov) => {
  let cfg = base + ov.named()
  set par(..cfg)
  c
}

// Renders a list of bullet items. Typography from bullet token; layout from doc.list.
// Named overrides (e.g. size: 0.8em) are merged into the bullet token at the call site.
#let render-bullets(items, style, ..ov) = {
  let b = style.global.layout.text-3 + ov.named()
  set text(size: b.size, tracking: b.tracking, weight: b.weight)
  for item in items [
    - #(style.layout.text-3)(..ov.named())[#item]
  ]
}

// Cannot use set list(..cfg) like the other doc factories because `list` has no `leading`
// parameter — leading is applied per-item via par instead.
#let make-doc-list(base) = (c, ..ov) => {
  let cfg = base + ov.named()
  set list(tight: cfg.tight, spacing: cfg.spacing)
  show list.item: it => {
    set par(leading: cfg.leading)
    it
  }
  c
}

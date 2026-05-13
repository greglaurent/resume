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

// Typography callable factory. Above/below v() emitted whenever `above`/
// `below` is present in cfg (token default OR per-call override). Per-call
// overrides replace token defaults via dict merge. `weak`, `weak-above`,
// `weak-below` are overrideable per call; default weak: true.
#let make-text(token) = (body, ..ov) => {
  let cfg = token + ov.named()
  let weak = cfg.at("weak", default: true)
  let weak-above = cfg.at("weak-above", default: weak)
  let weak-below = cfg.at("weak-below", default: weak)
  let content = style-text(body, cfg)
  if "above" in cfg { v(cfg.above, weak: weak-above) }
  content
  if "below" in cfg { v(cfg.below, weak: weak-below) }
}

// Block-level styled element — no Typst heading() node. Same unconditional
// cfg-based above/below emission as make-text.
#let make-block-heading(token) = (body, ..ov) => {
  let cfg = token + ov.named()
  let weak = cfg.at("weak", default: true)
  let weak-above = cfg.at("weak-above", default: weak)
  let weak-below = cfg.at("weak-below", default: weak)
  if "above" in cfg { v(cfg.above, weak: weak-above) }
  style-text(body, cfg)
  if "below" in cfg { v(cfg.below, weak: weak-below) }
}

// Heading callable. Emits cfg.above as v() before the heading and cfg.below
// after; the heading's intrinsic block is zeroed inside the inner scope so
// the v()s are the sole source of above/below. `weak` is overrideable per
// call — default true (collapses with adjacent par.spacing for normal
// typographic rhythm), pass `weak: false` to force visible space at flow
// boundaries.
// Heading callable. Block wrap at the call site is the sole source of
// above/below spacing — values come from cfg (token defaults, or per-call
// overrides via ov). Inner `set block(above: 0em, below: 0em)` zeroes the
// heading's intrinsic block so the wrap's values aren't compounded.
#let make-heading(token, level) = (body, ..ov) => {
  let cfg = token + ov.named()
  block(
    above: cfg.at("above", default: 0em),
    below: cfg.at("below", default: 0em),
    {
      set block(above: 0em, below: 0em)
      heading(level: level, numbering: cfg.at("numbering", default: none), style-text(body, cfg))
    },
  )
}

// Passthrough — heading block spacing is owned by make-heading's call-site
// block wrap. Kept as a function for API compatibility (style.doc.heading is
// consumed via `show: style.doc.heading` in apply.typ).
#let make-doc-heading(h1, h2, h3) = (c) => c

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

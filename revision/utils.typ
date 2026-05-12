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
  if "above" in cfg { v(cfg.above) }
  content
  if "below" in cfg { v(cfg.below) }
}

#let make-heading(token, level) = (body, ..ov) => {
  let cfg = token + ov.named()
  if cfg.at("stacking", default: false) {
    block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), level, numbering: cfg.numbering))
  } else {
    v(cfg.above)
    {
      show heading: set block(above: 0pt)
      set-heading(style-text(body, cfg), level, numbering: cfg.numbering)
    }
    v(cfg.below)
  }
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
  let b = style.global.layout.bullet + ov.named()
  set text(size: b.size, tracking: b.tracking, weight: b.weight)
  for item in items [
    - #(style.layout.bullet)(..ov.named())[#item]
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

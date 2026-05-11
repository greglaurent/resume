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
#let make-text(token) = (body, ..ov) => style-text(body, token + ov.named())

#let make-heading(token, level) = (body, ..ov) => {
  let cfg = token + ov.named()
  block(above: cfg.above, below: cfg.below, set-heading(style-text(body, cfg), level, numbering: cfg.numbering))
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
#let render-bullets(items, style) = {
  let b = style.global.layout.bullet
  set text(size: b.size, tracking: b.tracking, weight: b.weight)
  for item in items [
    - #(style.layout.bullet)[#item]
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

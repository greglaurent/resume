#let set-text(body, size, tracking, weight) = {
  text(
    body,
    size: size,
    tracking: tracking,
    weight: weight,
  )
}

#let set-smallcaps(body, size, tracking, weight) = {
  smallcaps(
    set-text(body, size, tracking, weight),
  )
}

#let set-heading(body, level) = heading(level: level, body)

#let style-text(body, cfg) = {
  if cfg.at("smallcaps", default: false) {
    set-smallcaps(body, cfg.size, cfg.tracking, cfg.weight)
  } else {
    set-text(body, cfg.size, cfg.tracking, cfg.weight)
  }
}

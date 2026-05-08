#let set-style(
  text-0-val: rgb("#16161D"),
  text-1-val: rgb("#6C757D"),
  text-2-val: rgb("#A2A2A5"),
) = {
  let base = (
    text-0: text-0-val,
    text-1: text-1-val,
    text-2: text-2-val,
  )

  (
    base
      + (
        dot-divider: text(sym.circle.filled, fill: base.text-2),
      )
  )
}

#let stylesheet = (
  us: set-style(),
  cv: set-style(),
)

#let get-style(region) = stylesheet.at(region)

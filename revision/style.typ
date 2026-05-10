#import "utils.typ": set-smallcaps, set-text

#let make-global(font, color-0, color-1, color-2) = (
  font: font,
  color-0: color-0,
  color-1: color-1,
  color-2: color-2,
)

#let make-header(global) = {
  let title-size = 2em
  let title-tracking = 1pt
  let title-weight = "regular"
  let subtitle-size = 1.2em
  let subtitle-tracking = 1pt
  let subtitle-weight = "regular"
  (
    title: body => set-smallcaps(body, title-size, title-tracking, title-weight),
    subtitle: body => set-text(body, subtitle-size, subtitle-tracking, subtitle-weight),
    dot-divider: text(sym.circle.filled, fill: global.color-2),
  )
}

#let make-summary(global) = {
  let size = 1em
  let tracking = 1pt
  let weight = "regular"
  (
    body: body => set-text(body, size, tracking, weight),
  )
}

#let make-experience(global) = (:)

#let set-style(
  font: "EB Garamond",
  color-0: rgb("#16161D"),
  color-1: rgb("#6C757D"),
  color-2: rgb("#A2A2A5"),
) = {
  let global = make-global(font, color-0, color-1, color-2)
  (
    global: global,
    header: make-header(global),
    summary: make-summary(global),
    experience: make-experience(global),
  )
}

#let stylesheet = (
  us: set-style(),
  cv: set-style(font: "Source Serif 4"),
)

#let get-style(region) = stylesheet.at(region)

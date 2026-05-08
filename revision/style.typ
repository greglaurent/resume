#import "utils.typ": set-smallcaps, set-text

#let set-style(
  font: "Apple Garamond",
  color-0-val: rgb("#16161D"),
  color-1-val: rgb("#6C757D"),
  color-2-val: rgb("#A2A2A5"),
) = {
  let base = (
    font: font,
    color-0: color-0-val,
    color-1: color-1-val,
    color-2: color-2-val,
    title-size: 2em,
    title-tracking: 1pt,
    title-weight: "regular",
    subtitle-size: 1.2em,
    subtitle-tracking: 1pt,
    subtitle-weight: "regular",
  )

  (
    base
      + (
        dot-divider: text(sym.circle.filled, fill: base.color-2),
        title: body => set-smallcaps(
          body,
          base.title-size,
          base.title-tracking,
          base.title-weight,
        ),
        subtitle: body => set-smallcaps(
          body,
          base.subtitle-size,
          base.subtitle-tracking,
          base.subtitle-weight,
        ),
      )
  )
}

#let stylesheet = (
  us: set-style(),
  cv: set-style(font: "Source Serif 4"),
)

#let get-style(region) = stylesheet.at(region)

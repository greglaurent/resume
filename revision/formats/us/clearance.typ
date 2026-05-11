#let render-clearance(data, style) = {
  (style.layout.h2)[Clearance]
  stack(
    spacing: 0.5em,
    (style.layout.h3)[#data.level • #data.year],
    (style.layout.body)[#data.status],
  )
}

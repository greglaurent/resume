#let render-clearance(data, style) = {
  (style.clearance.heading)[Clearance]
  stack(
    spacing: 0.5em,
    (style.clearance.subheading)[#data.level • #data.year],
    [#data.status],
  )
}

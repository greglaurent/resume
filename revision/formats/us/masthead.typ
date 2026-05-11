#let render-masthead(data, style) = {
  stack(
    spacing: 0.75em,
    (style.masthead.heading)(data.name),
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      gutter: 0.25em,
      (style.masthead.subtitle)(data.phone),
      (style.masthead.subtitle)(data.location),
      (style.masthead.subtitle)(data.email),
    ),
  )
  v(0.15em)
  line(length: 100%, stroke: 0.5pt + style.global.color-2)
}

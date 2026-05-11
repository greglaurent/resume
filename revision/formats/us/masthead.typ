#let render-masthead(data, style) = {
  stack(
    spacing: 0.75em,
    (style.masthead.heading)(data.name),
    (style.masthead.subtitle)(data.subtitle),
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      gutter: 0.25em,
      (style.masthead.contact)(data.phone),
      (style.masthead.contact)(data.location),
      (style.masthead.contact)(data.email),
    ),
  )
  v(0.15em)
  line(length: 100%, stroke: 0.5pt + style.global.color-2)
}

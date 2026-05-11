#let render-masthead(data, style) = {
  stack(
    spacing: 0.75em,
    (style.layout.h1)(data.name),
    (style.layout.subtitle)(data.subtitle),
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      gutter: 0.25em,
      (style.layout.contact)(data.phone),
      (style.layout.contact)(data.location),
      (style.layout.contact)(data.email),
    ),
  )
  v(0.15em)
  line(length: 100%, stroke: 0.5pt + style.global.colors.accent)
}

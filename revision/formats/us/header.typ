#let build-header(data, style) = {
  stack(
    spacing: 1em,
    (style.header.title)(data.name),
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      gutter: 0.5em,
      (style.header.subtitle)(data.phone), (style.header.subtitle)(data.location), (style.header.subtitle)(data.email),
    ),
  )
}

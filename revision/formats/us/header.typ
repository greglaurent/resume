#let build-header(data, style) = {
  stack(
    (style.title)(data.name),
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      gutter: 0.5em,
      (style.subtitle)(data.phone), (style.subtitle)(data.location), (style.subtitle)(data.email),
    ),
  )
}

#let render-masthead(l, data) = {
  (l.heading-1)[#data.name]

  (l.text-4)[#smallcaps(data.subtitle)]

  v(0.5em)

  grid(
    columns: (1fr, 1fr, 1fr),
    align: (left, center, right),
    gutter: 0.25em,
    [#(l.icons.phone)(font: l.icons.font, solid: true) #h(0.4em) #data.phone],
    [#(l.icons.location)(font: l.icons.font, solid: true) #h(0.4em) #data.location],
    [#text(baseline: 0.15em, (l.icons.envelope)(font: l.icons.font, solid: true)) #h(0.4em) #data.email],
  )

  v(0.3em)
  (l.divider)()
}

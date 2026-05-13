#let render-experience(layout, entries) = {
  (layout.h2)[Experience]
  show heading.where(level: 3): set text(weight: 500)
  for entry in entries {
    grid(
      columns: (50%, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      (layout.h3)[#entry.role], align(right, (layout.h3)[#entry.start — #entry.end]),
      [#entry.company], align(right)[#entry.location],
    )
    (layout.text-3)(emph: true)[#entry.summary]
    for bullet in entry.bullets [- #bullet]
  }
}

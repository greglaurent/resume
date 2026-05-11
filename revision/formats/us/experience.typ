#let render-experience(entries, style) = {
  (style.layout.h2)[Experience]
  for entry in entries {
    grid(
      columns: (40%, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      (style.layout.h3)[#entry.role], (style.layout.h3)[#entry.start — #entry.end],
      (style.layout.caption)[#entry.company], (style.layout.caption)[#entry.location],
    )

    block(
      below: 1em,
      (style.layout.body)(size: 0.9em, leading: 0.5em, emph: true)[#entry.summary],
    )

    for bullet in entry.bullets [
      - #bullet
    ]
    v(0.5em)
  }
}

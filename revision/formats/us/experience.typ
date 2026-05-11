#let render-experience(entries, style) = {
  (style.layout.h2)[Experience]
  for entry in entries {
    grid(
      columns: (40%, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      (style.layout.h3)[#entry.role], (style.layout.h3)[#entry.start — #entry.end],
      (style.layout.body)(size: 0.9em)[#entry.company], (style.layout.body)[#entry.location],
    )

    block(
      below: 1em,
      (style.layout.body)(size: 0.9em, emph: true, leading: 0.5em)[#entry.summary],
    )

    for bullet in entry.bullets [
      - #(style.layout.bullet)[#bullet]
    ]
    v(0.5em)
  }
}

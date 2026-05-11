#let render-experience(entries, style) = {
  (style.experience.heading)[Experience]
  for entry in entries {
    grid(
      columns: (40%, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      (style.experience.subheading)[#entry.role], (style.experience.dates)[#entry.start — #entry.end],
      (style.experience.caption)[#entry.company], (style.experience.caption)[#entry.location],
    )

    (style.experience.summary)[#entry.summary]

    for bullet in entry.bullets [
      - #bullet
    ]
    v(0.5em)
  }
}

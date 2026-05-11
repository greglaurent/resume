#let render-education(entries, style) = {
  (style.layout.h2)[Education]
  for entry in entries {
    stack(
      spacing: 0.5em,
      (style.layout.h3)[#entry.school • #entry.year],
      [#entry.degree],
      [#entry.major],
    )
  }
}

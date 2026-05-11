#let render-education(entries, style) = {
  (style.layout.h2)[Education]
  for entry in entries {
    stack(
      spacing: 0.5em,
      (style.layout.h3)[#entry.school • #entry.year],
      (style.layout.body)[#entry.degree],
      (style.layout.bullet)[#entry.major],
    )
  }
}

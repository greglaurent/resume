#let render-education(entries, style) = {
  (style.education.heading)[Education]
  for entry in entries {
    stack(
      spacing: 0.5em,
      (style.education.subheading)[#entry.school • #entry.year],
      [#entry.degree],
      [#entry.major],
    )
  }
}

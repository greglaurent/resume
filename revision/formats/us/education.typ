#let render-education(layout, entries) = {
  (layout.h2)[Education]
  for entry in entries {
    (layout.h3)[#entry.school • #entry.year]
    [#entry.degree]
    (layout.text-2)[#entry.major]
  }
}

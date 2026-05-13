#let render-education(layout, entries) = {
  (layout.h2)[Education]
  for entry in entries {
    (layout.h3)[#entry.school • #entry.year]
    (layout.text-4)[#entry.degree]
    (layout.text-3)[#entry.major]
  }
}

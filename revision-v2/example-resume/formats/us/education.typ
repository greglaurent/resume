#let render-education(l, entries) = {
  (l.heading-2)[Education]
  for entry in entries {
    (l.heading-3)[#entry.school #sym.bullet #entry.year]
    (l.text-4)[#entry.degree]
    (l.text-3)[#entry.major]
  }
}

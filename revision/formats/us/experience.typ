#let render-experience(layout, entries) = {
  (layout.h2)[Experience]
  for entry in entries {
    (layout.h3-special)[#box(width: 60%)[#entry.role]#box(width: 40%)[#entry.start — #entry.end]]

    (layout.text-4)[#box(width: 60%)[#entry.company]#box(width: 40%)[#entry.location]]

    (layout.text-3)(emph: true)[#entry.summary]

    for bullet in entry.bullets [- #bullet]
  }
}

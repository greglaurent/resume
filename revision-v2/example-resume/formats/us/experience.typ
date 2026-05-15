#let render-experience(l, entries) = {
  (l.heading-2)[Experience]
  for entry in entries {
    (l.heading-3)[#entry.role #h(1fr) #entry.start — #entry.end]
    (l.text-4)[#entry.company #h(1fr) #entry.location]
    (l.text-3)(style: "italic", above: 1.25em, below: 1em)[#entry.summary]
    for bullet in entry.bullets {
      (l.text-3)(above: 1em)[#bullet]
    }
  }
}

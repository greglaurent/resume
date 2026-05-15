#let render-experience(l, entries) = {
  (l.heading-2)[Experience]
  for entry in entries {
    (l.heading-3)(weight: 500)[#entry.role #h(1fr) #text(weight: 400)[#entry.start — #entry.end]]
    (l.text-4)[#entry.company #h(1fr) #entry.location]
    v(0.2em)
    (l.text-1)(style: "italic")[#entry.summary]
    for bullet in entry.bullets {
      (l.text-1)[- #bullet]
    }
    v(0.4em)
  }
}

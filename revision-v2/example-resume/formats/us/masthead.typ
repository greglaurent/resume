#let render-masthead(l, data) = {
  (l.heading-1)(below: 1em)[#data.name]

  (l.text-4)(below: 0.5em)[#smallcaps(data.subtitle)]

  (l.text-3)[
    #(l.icons.phone)(font: l.icons.font, solid: true) #h(0.4em) #data.phone
    #h(1fr)
    #(l.icons.location)(font: l.icons.font, solid: true) #h(0.4em) #data.location
    #h(1fr)
    #text(baseline: 0.15em, (l.icons.envelope)(font: l.icons.font, solid: true)) #h(0.4em) #data.email
  ]
  (l.divider)(above: 0.75em)
}

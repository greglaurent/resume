#let render-experience(l, entries) = {
  (l.heading-2)(smallcaps: true, below: 1.25em)[Experience]
  for entry in entries {
    grid(
      columns: (1fr, 3fr),
      column-gutter: 1.5em,
      row-gutter: 1.5em,
      grid.cell(colspan: 2)[
        #(l.text-5)(
          below: 1em,
        )[#entry.role #h(1fr) #entry.start — #entry.end]
      ],
      {
        (l.text-4)(below: 0.5em)[#entry.company]
        (l.text-3)[#entry.location]
      },
      {
        //(l.text-3)(below: 0.5em)[#entry.location]
        (l.text-3)(style: "italic")[#entry.summary]
      },
      grid.cell(colspan: 2)[
        //#(l.text-5)(
        //  below: 1em,
        //)[#entry.company #h(1fr) #entry.start — #entry.end]

        #for bullet in entry.bullets {
          (l.text-3)(above: 0.75em, leading: 0.25em)[#bullet]
        }
      ],
    )
    v(0.25em)
  }
}

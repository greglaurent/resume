#import "../../content/experience.typ": content

#let render-experience(l) = {
  (l.heading-2)(smallcaps: true, below: 1.25em)[Experience]
  for entry in content {
    grid(
      columns: (1fr, 2fr),
      //column-gutter: 0em,
      row-gutter: 1.1em,
      grid.cell(colspan: 2)[
        #(l.text-5)[#entry.role #h(1fr) #entry.start — #entry.end]
      ],
      {
        (l.text-4)(below: 0.5em)[#entry.company]
        (l.text-3)[#entry.location]
      },
      {
        (l.text-3)(style: "italic")[#entry.summary]
      },
      grid.cell(colspan: 2)[
        #for bullet in entry.bullets {
          (l.text-3)(above: 0.75em, leading: 0.5em, tracking: 0.1pt)[#bullet]
        }
      ],
    )
    //v(0.25em)
  }
}

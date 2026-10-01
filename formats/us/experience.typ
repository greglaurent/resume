#import "../../content/experience.typ": content

#let render-experience(l) = {
  (l.heading-2)(smallcaps: true)[Experience]
  for (index, entry) in content.enumerate() {
    v(if index == 0 { l.gap.label } else { l.gap.entry })
    grid(
      columns: (1fr, 2fr),
      // Grid gutters preserve title spacing at cell boundaries.
      row-gutter: (l.gap.label, 0pt),
      grid.cell(colspan: 2)[
        #(l.text-5)[#entry.role #h(1fr) #entry.start — #entry.end]
      ],
      {
        (l.text-4)()[#entry.company]
        (l.text-3)[#entry.location]
      },
      {
        (l.text-3)(style: "italic")[#entry.summary]
      },
      grid.cell(colspan: 2)[
        #for (bullet-index, bullet) in entry.bullets.enumerate() {
          (l.text-3)(
            above: if bullet-index == 0 { l.gap.heading } else { l.gap.paragraph },
            tracking: 0.1pt,
          )[#bullet]
        }
      ],
    )
  }
}

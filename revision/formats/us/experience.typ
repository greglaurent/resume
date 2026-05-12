#import "../../style/scale.typ": leading-tight

#let render-experience(layout, entries) = {
  show grid: set block(above: 0pt)
  show list: set block(below: 0pt)

  (layout.h2)[Experience]
  for entry in entries {
    grid(
      columns: (50%, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      (layout.h3)[#entry.role],
      align(right, (layout.h3)[#entry.start — #entry.end]),
      [#entry.company],
      align(right)[#entry.location],
    )
    (layout.text-3)(emph: true, leading: leading-tight)[#entry.summary]
    for bullet in entry.bullets [- #bullet]
  }
}

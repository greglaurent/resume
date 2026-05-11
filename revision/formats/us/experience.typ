#import "../../utils.typ": render-bullets

#let render-experience(entries, style) = {
  (style.layout.h2)[Experience]
  for entry in entries {
    grid(
      columns: (50%, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      (style.layout.h3)[#entry.role], (style.layout.h3)[#entry.start — #entry.end],
      (style.layout.body)[#entry.company], (style.layout.body)[#entry.location],
    )

    block(
      below: 1em,
      (style.layout.body)(emph: true, leading: 0.5em)[#entry.summary],
    )

    render-bullets(entry.bullets, style)
  }
}

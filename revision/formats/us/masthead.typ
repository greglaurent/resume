#import "@preview/fontawesome:0.5.0": fa-envelope, fa-github, fa-linkedin, fa-location-dot, fa-mobile-screen-button

#let render-masthead(layout, data) = {
  (layout.h1)(size: 2em, above: 0em, below: 0.75em)[#data.name]
  (layout.text-4)(tracking: 0.01em, smallcaps: true, below: 0.75em)[#data.subtitle]
  grid(
    columns: (1fr, 1fr, 1fr),
    align: (left, center, right),
    gutter: 0.25em,
    [#fa-mobile-screen-button(font: layout.icons.font, solid: true) #data.phone],
    [#fa-location-dot(font: layout.icons.font, solid: true) #data.location],
    [#text(baseline: 0.15em, fa-envelope(font: layout.icons.font, solid: true)) #data.email],
  )
  line(length: 100%, stroke: 0.5pt + layout.color-2)
}

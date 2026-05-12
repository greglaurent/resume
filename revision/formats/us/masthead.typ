#import "@preview/fontawesome:0.5.0": fa-envelope, fa-location-dot, fa-mobile-screen-button
#let fa-font = "Font Awesome 7 Free Solid"

#let render-masthead(data, style) = {
  (style.layout.h1)(data.name)
  (style.layout.subtitle)(data.subtitle)
  grid(
    columns: (1fr, 1fr, 1fr),
    align: (left, center, right),
    gutter: 0.25em,
    (style.layout.contact)[#fa-mobile-screen-button(font: fa-font, solid: true) #data.phone],
    (style.layout.contact)[#fa-location-dot(font: fa-font, solid: true) #data.location],
    (style.layout.contact)[#text(baseline: 0.15em, fa-envelope(font: fa-font, solid: true)) #data.email],
  )
  line(length: 100%, stroke: 0.5pt + style.global.colors.accent)
}

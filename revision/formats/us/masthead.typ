#import "@preview/fontawesome:0.5.0": fa-phone, fa-location-dot, fa-envelope
#let fa-font = "Font Awesome 7 Free"

#let render-masthead(data, style) = {
  stack(
    spacing: 0.75em,
    (style.layout.h1)(data.name),
    (style.layout.subtitle)(data.subtitle),
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      gutter: 0.25em,
      (style.layout.contact)[#fa-phone(font: fa-font) #data.phone],
      (style.layout.contact)[#fa-location-dot(font: fa-font) #data.location],
      (style.layout.contact)[#fa-envelope(font: fa-font) #data.email],
    ),
  )
  v(0.15em)
  line(length: 100%, stroke: 0.5pt + style.global.colors.accent)
}

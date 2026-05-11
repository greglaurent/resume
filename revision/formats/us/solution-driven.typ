#let render-solution-driven(bullets, style) = {
  (style.layout.h2)[Solution-driven]
  set text(..style.global.layout.bullet)
  for bullet in bullets [
    - #(style.layout.bullet)[#bullet]
  ]
}

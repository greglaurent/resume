#let render-holistic-approach(bullets, style) = {
  (style.layout.h2)[Holistic Approach]
  set text(..style.global.layout.bullet)
  for bullet in bullets [
    - #(style.layout.bullet)[#bullet]
  ]
}

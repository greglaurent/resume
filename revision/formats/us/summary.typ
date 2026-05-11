#let render-summary(body, style) = {
  (style.layout.body)(body)
  v(0.15em)
  line(length: 100%, stroke: 0.5pt + style.global.colors.accent)
}

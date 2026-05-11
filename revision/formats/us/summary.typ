#let render-summary(body, style) = {
  (style.layout.body)(body)
  line(length: 100%, stroke: 0.5pt + style.global.colors.accent)
}

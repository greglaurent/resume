#import "../../utils.typ": render-bullets

#let render-solution-driven(bullets, style) = {
  (style.layout.h2)[Solution-driven]
  render-bullets(bullets, style, size: 0.9em)
}

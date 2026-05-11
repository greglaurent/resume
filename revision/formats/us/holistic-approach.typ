#import "../../utils.typ": render-bullets

#let render-holistic-approach(bullets, style) = {
  (style.layout.h2)[Holistic Approach]
  render-bullets(bullets, style, size: 0.9em)
}

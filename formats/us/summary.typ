#import "../../content/summary.typ": content;

#let render-summary(l) = {
  (l.text-3)(above: 0.25em, below: 0.25em)[#content]
  (l.divider)()
}

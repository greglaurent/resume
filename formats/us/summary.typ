#import "../../content/summary.typ": content;

#let render-summary(l) = {
  (l.text-3)(above: 1.25em, below: 1.25em)[#content]
  (l.divider)()
}

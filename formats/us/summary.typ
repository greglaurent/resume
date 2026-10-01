#import "../../content/summary.typ": content;

#let render-summary(l) = {
  (l.text-3)(above: l.gap.label, below: l.gap.label)[#content]
  (l.divider)()
}

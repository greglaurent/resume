#import "../../content/clearance.typ": content

#let render-clearance(l) = {
  (l.heading-2)[Clearance]
  (l.heading-3)[#content.level #sym.bullet #content.year]
  (l.text-4)[#content.status]
}

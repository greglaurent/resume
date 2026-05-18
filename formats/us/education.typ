#import "../../content/education.typ": content

#let render-education(l) = {
  (l.heading-2)[Education]
  for entry in content {
    (l.heading-3)[#entry.school #sym.bullet #entry.year]
    (l.text-4)(below: 0.75em)[#entry.degree]
    (l.text-3)[#entry.major]
  }
}

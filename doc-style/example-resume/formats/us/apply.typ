#import "masthead.typ": render-masthead
#import "summary.typ": render-summary
#import "experience.typ": render-experience
#import "education.typ": render-education
#import "clearance.typ": render-clearance

#let apply(l, data) = {
  render-masthead(l, data.masthead)
  render-summary(l, data.summary)
  render-experience(l, data.experience)

  v(0.5em)
  grid(
    columns: (3fr, 2fr),
    gutter: 1.5em,
    render-education(l, data.education),
    render-clearance(l, data.clearance),
  )
}

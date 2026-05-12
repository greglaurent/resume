#import "masthead.typ": render-masthead
#import "summary.typ": render-summary
#import "experience.typ": render-experience
#import "education.typ": render-education
#import "solution-driven.typ": render-solution-driven
#import "holistic-approach.typ": render-holistic-approach
#import "clearance.typ": render-clearance

#let apply(content, style, data) = {
  set rect(width: 100%, height: auto, inset: 4pt)

  show: (style.doc.par)
  show: (style.doc.list)
  show: (style.doc.text)
  show: (style.doc.page)

  render-masthead(data, style)
  render-summary(data.summary, style)
  render-experience(data.experience, style)
  //grid(
  //  columns: (1fr, 1fr),
  //  column-gutter: 1em,
  //  render-solution-driven(data.solution-driven, style), render-holistic-approach(data.holistic-approach, style),
  //)
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    render-education(data.education, style), render-clearance(data.clearance, style),
  )
  content
}

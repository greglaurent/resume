#import "../../style.typ": stylesheet
#import "masthead.typ": render-masthead
#import "summary.typ": render-summary
#import "experience.typ": render-experience
#import "education.typ": render-education
#import "solution-driven.typ": render-solution-driven
#import "holistic-approach.typ": render-holistic-approach
#import "clearance.typ": render-clearance

#let apply(content, data) = {
  let style = stylesheet.us
  show: style.doc.page
  show: style.doc.text
  show: style.doc.par
  show: style.doc.list
  show: style.doc.heading

  let layout = style.layout
  render-masthead(layout, data)
  render-summary(layout, data.summary)
  render-experience(layout, data.experience)
  grid(
    columns: (50%, 1fr),
    column-gutter: 1em,
    render-education(layout, data.education), render-clearance(layout, data.clearance),
  )
  content
}

#import "../../utils.typ": make-heading
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
  let layout = (
    layout
      + (
        h3-special: make-heading(
          layout.tokens.h3 + (weight: 500),
          3,
        ),
      )
  )

  render-masthead(layout, data)
  render-summary(layout, data.summary)
  render-experience(layout, data.experience)
  block(above: layout.spacing.heading-above, stack(
    dir: ltr,
    box(width: 60%, render-education(layout, data.education)),
    box(width: 40%, render-clearance(layout, data.clearance)),
  ))
  content
}

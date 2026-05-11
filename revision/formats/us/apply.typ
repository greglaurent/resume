#import "masthead.typ": render-masthead
#import "summary.typ": render-summary
#import "experience.typ": render-experience
#import "education.typ": render-education
#import "solution-driven.typ": render-solution-driven
#import "holistic-approach.typ": render-holistic-approach
#import "clearance.typ": render-clearance

#let apply(content, style, data) = {
  set rect(
    width: 100%,
    height: auto,
    inset: 4pt,
  )

  set par(spacing: 1em, leading: 1em, justify: true)
  set list(tight: style.global.list.tight)
  show list.item: it => {
    set par(leading: style.global.list.leading)
    it
  }

  set text(
    font: style.global.font,
    size: 12pt,
    tracking: 1pt,
    weight: 500,
    fill: style.global.color-0,
  )

  set page(
    paper: "us-letter",
    margin: (left: 1in, top: 0.75in, right: 1in, bottom: 1in),
  )

  render-masthead(data, style)
  render-summary(data.summary, style)
  render-experience(data.experience, style)
  //grid(
  //  columns: (1fr, 1fr),
  //  column-gutter: 1em,
  //  render-solution-driven(data.solution-driven, style),
  //  render-holistic-approach(data.holistic-approach, style),
  //)
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    render-education(data.education, style), render-clearance(data.clearance, style),
  )
  content
}

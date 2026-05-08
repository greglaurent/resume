#import "header.typ": build-header
#import "sections.typ": experience-section

#let apply(content, style, data) = {
  set rect(
    width: 100%,
    height: 100%,
    inset: 4pt,
  )

  set par(spacing: 1em, leading: 1em, justify: true)

  set text(
    font: style.font,
    size: 12pt,
    tracking: 1pt,
    weight: 500,
    fill: style.color-0,
  )

  set page(
    paper: "us-letter",
    margin: (left: 1in, top: 0.75in, right: 1in, bottom: 1in),
    header: rect(fill: aqua)[ #build-header(data, style) ],
  )

  experience-section(data.experience, style)
  content
}

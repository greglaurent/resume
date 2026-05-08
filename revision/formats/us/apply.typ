#import "header.typ": build-header
#import "sections.typ": experience-section

#let apply(content, style, data) = {
  set par(spacing: 1em, leading: 1em, justify: true)

  set text(
    font: "IBM Plex Sans",
    size: 12pt,
    tracking: 1pt,
    weight: 500,
    fill: style.text-0,
  )

  set page(
    paper: "us-letter",
    margin: (top: 5cm),
    header: build-header(data, style),
  )

  experience-section(data.experience, style)
  content
}

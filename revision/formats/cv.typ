#let apply(content, style, data) = {
  set par(spacing: 1em, leading: 1em, justify: true)

  set text(
    font: "Cantarell",
    size: 24pt,
    tracking: 1pt,
    weight: 500,
    fill: style.text-2,
  )

  set page(
    paper: "a4",
    margin: (top: 1cm),
    header: {
      data.name
    },
  )


  content // Return styled content
}

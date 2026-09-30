#import "@local/press:0.1.0": document
#import "formatter.typ": make

#import "masthead.typ": render-masthead
#import "summary.typ": render-summary
#import "experience.typ": render-experience
#import "education.typ": render-education
#import "clearance.typ": render-clearance

#let apply() = document(
  formatter: make,
  config: (
    theme: (bg: white),
    measure: 66,
    // Cascade 2 uses base for the body size and ratio/n for the scale.
    base: 11.5pt,
    // Font families and their measured metrics come from the Nix-built profile.
    ratio: 1.618033988749895,
    n: 2,
    page: (paper: "us-letter", margin: 0.75in),
  ),
  compose: l => {
    render-masthead(l)
    render-summary(l)
    render-experience(l)

    v(l.gap.section)
    grid(
      columns: (3fr, 2fr),
      gutter: 1.5em,
      render-education(l), render-clearance(l),
    )
  },
)

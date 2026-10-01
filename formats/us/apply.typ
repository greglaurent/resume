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
    // Cascade's public font overrides: measurements from `cascade measure` on
    // the Nix-provided Regular faces; optical profiles use sans/serif defaults.
    avg-advance: 0.4287,
    fonts: (
      body: (
        family: ("Quattrocento Sans",), x-height: 0.460,
        leading-base: 1.3, tracking-k: 0.078, word-space: 0.28,
      ),
      heading: (
        family: ("Quattrocento",), x-height: 0.459,
        leading-base: 1.2, tracking-k: 0.078, word-space: 0.28,
      ),
    ),
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

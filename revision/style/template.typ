#import "scale.typ": *

// lead: lede paragraph or pull quote. Sets size-lead; leading inherits via em.
#let lead(body) = {
  set text(size: size-lead)
  body
}

// cap: standalone caption-weight text (not inside a figure).
#let cap(body) = {
  set text(size: size-caption, tracking: tracking-caption)
  set par(leading: leading-loose)
  body
}

// doc: applies the full type system as set/show rules over body.
// All numeric dimensions come from scale.typ. None are literal values.
#let doc(title: none, body) = {
  set page(
    paper: "us-letter",
    margin: (
      inside:  margin-inner,
      outside: margin-outer,
      top:     margin-top,
      bottom:  margin-bottom,
    ),
  )

  // top-edge / bottom-edge pin the line box to cap-height and baseline.
  // This makes leading the precise baseline-to-cap-height gap of the next line,
  // giving exact control over vertical rhythm. See spec non-negotiable #5.
  set text(
    size:        size-body,
    font:        "EB Garamond",
    top-edge:    "cap-height",
    bottom-edge: "baseline",
  )

  set par(
    leading:           leading-body,
    spacing:           space-paragraph,
    justify:           true,
    first-line-indent: indent-first-line,
  )

  set list(indent: indent-list)

  // Headings: tight leading for all levels, then level-specific size and block spacing.
  // show heading.where(level: N): set block(above/below) is set at document scope
  // so that the rules are guaranteed to apply wherever headings are rendered.
  // (show rules inside closures do not propagate to the layout scope.)
  // Heading tight leading applies at all levels.
  // Text sizes and block spacing are NOT set here — each format installs its own
  // heading styles via style.doc.heading so the callable system owns sizing.
  show heading: set par(leading: leading-tight)

  // Code blocks and figures: spaced by the same rhythm unit as paragraphs.
  show raw.where(block: true): set block(above: space-block, below: space-block)
  show figure:                 set block(above: space-block, below: space-block)
  show figure.caption: set text(size: size-caption, tracking: tracking-caption)
  show figure.caption: set par(leading: leading-loose)

  // Block quotes: inset by indent-quote on both sides, spaced like other blocks.
  show quote.where(block: true): it => block(
    above: space-block,
    below: space-block,
    pad(left: indent-quote, right: indent-quote, it),
  )

  body
}

#import "@local/press:0.1.0": cascade-formatter
#import "@local/resume-typography:2.0.0" as cascade
#import "@preview/fontawesome:0.5.0": fa-envelope, fa-github, fa-linkedin, fa-location-dot, fa-mobile-screen-button

// Extend the shared Press/Cascade formatter with resume-specific components.
#let make(config) = {
  let base = cascade-formatter(cascade, config)
  let spec = (base.resolve)(config)

  // Cascade supplies line metrics; the resume owns spacing between components.
  // Explicit zero defaults prevent its paragraph rhythm from adding block gaps.
  // The exported scale helper recomputes optical metrics for each role.
  let role(step, body, above: 0pt, below: 0pt, leading: 0pt, ..overrides) = block(
    above: above,
    below: below,
    {
      set par(leading: leading, spacing: 0pt)
      (base.scale)(step, body, ..overrides.named())
    },
  )
  // Display labels need glyph-sized boxes, not paragraph-height line boxes.
  // Keep Cascade's font sizes and optical spacing; trim only label edge padding.
  let label(step, body, font: "body", weight: 400, smallcaps: false,
    above: 2pt, below: 2pt) = {
    let face = spec.fonts.at(font)
    block(above: above, below: below, {
      set par(leading: 0pt, spacing: 0pt)
      text(
        font: face.family, size: (base.size)(spec, step), weight: weight,
        tracking: (base.tracking)(spec, face, step)
          + if smallcaps { spec.smallcaps-tracking * 1em } else { 0em },
        spacing: 100% + (base.word-space)(spec, face, step),
        top-edge: "cap-height", bottom-edge: "descender",
        if smallcaps { std.smallcaps(body) } else { body },
      )
    })
  }
  // One compact spacing scale: labels stay close to their content, while
  // sections and separate jobs receive a larger visual break.
  let gap = (label: 2pt, heading: 4pt, section: 9pt, entry: 9pt, paragraph: 0.5pt)
  base + (
    gap: gap,
    markup: body => {
      set par(spacing: 0pt)
      set block(above: 0pt, below: 0pt)
      body
    },
    page: body => (base.page)({ set page(numbering: none); body }),
    heading-1: label.with(4, font: "heading", weight: 700,
      above: 0pt, below: gap.label),
    heading-2: label.with(3, font: "heading", weight: 700,
      above: gap.section, below: gap.heading),
    heading-3: label.with(2, font: "heading", weight: 700,
      above: 0pt, below: gap.label),
    text-3: role.with(0),
    text-4: label.with(1, above: 0pt, below: gap.label),
    text-5: label.with(2, above: 0pt, below: gap.label),
    divider: (above: gap.heading, below: gap.heading) => block(
      above: above, below: below,
      line(length: 100%, stroke: 0.5pt + spec.theme.rule),
    ),
    icons: (
      font: "Font Awesome 7 Free Solid",
      envelope: fa-envelope,
      github: fa-github,
      linkedin: fa-linkedin,
      location: fa-location-dot,
      phone: fa-mobile-screen-button,
    ),
  )
}

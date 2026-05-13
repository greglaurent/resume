// Demo sheet — exercises every role in the scale system with spec defaults
// plus a wider measure (100) so the typographic structure is visible.
// Compare to stylesheet.us to see what the resume preset overrides.
//
// Run:
//   typst compile --root . style/demo.typ

#import "../style.typ": set-style
#import "scale.typ" as scale
#import "scale.typ": *

#let demo-measure = 100   // wider than book canon (66) so labels don't wrap
#let style = set-style(measure: demo-measure)
#let layout = style.layout

#show: style.doc.page
#show: style.doc.text
#show: style.doc.par
#show: style.doc.list
#show: style.doc.heading

// === Header ===
#(layout.h1)[Scale system demo]

#(layout.text-2)[
  spec defaults — set-style(measure: #demo-measure) \
  font: *#style.global.doc.text.font* (cap-em #style.global.cap-em) \
  paper: *#style.global.doc.page.paper* — content width *#scale.measure-width-for(style.global.doc.text.font, measure: demo-measure)* \
  base: *#base* | ratio: *#ratio*
]

// === Sizes ===
#(layout.h2)[Sizes — Section A]

#(layout.text-3)[Each size is `ms(n) = base × ratio^n`. Step n in parens.]

#text(size: size-caption)[size-caption (−2) — #size-caption]\
#text(size: size-small)[size-small (−1) — #size-small]\
#text(size: size-body)[size-body (0) — #size-body]\
#text(size: size-h4)[size-h4 / size-lead (1) — #size-h4]\
#text(size: size-h3)[size-h3 (2) — #size-h3]\
#text(size: size-h2)[size-h2 (3) — #size-h2]\
#text(size: size-h1)[size-h1 (4) — #size-h1]\
#text(size: size-display)[size-display (5) — #size-display]

// === Leading ===
#(layout.h2)[Leading — Section B]

#(layout.text-3)[
  Spec: `leading_role = 1em + (ratio − 1) × k × em` (k ∈ {1, 2, 3}) in baseline-to-baseline. Typst gap = b2b − cap-em × 1em.
]

#(layout.h3)[leading-body, k=2 — #style.global.leading.body (Typst gap)]

#(layout.text-3)[Body, lead, h3–h6. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.]

#(layout.h3)[leading-tight, k=1 — #style.global.leading.tight (Typst gap)]

#text(size: size-h1)[
  #set par(leading: style.global.leading.tight)
  Display headings tighten. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt.
]

#(layout.h3)[leading-loose, k=3 — #style.global.leading.loose (Typst gap)]

#text(size: size-small)[
  #set par(leading: style.global.leading.loose)
  Small text loosens for legibility. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
]

// === Tracking ===
#(layout.h2)[Tracking — Section E]

#(layout.text-3)[
  Spec: `tracking = (ratio − 1) × differentiator × em`. Negative for display (tighten), positive for small (loosen). Differentiators ∈ {1/8, 1/4, 1/3, 1/2, 2/3}.
]

#text(tracking: tracking-display, size: size-display)[Display −1/3] \
#text(tracking: tracking-h-large, size: size-h1)[h1 large −1/4] \
#text(tracking: tracking-h-small, size: size-h4)[h4 small −1/8] \
#text(tracking: tracking-body, size: size-body)[Body — zero tracking] \
#text(tracking: tracking-small, size: size-small)[Small +1/8] \
#text(tracking: tracking-caption, size: size-caption)[Caption +1/4] \
#smallcaps(text(tracking: tracking-smallcaps, size: size-body)[Smallcaps +1/2]) \
#text(tracking: tracking-allcaps, size: size-body)[ALLCAPS +2/3]

// === Block spacing ===
#(layout.h2)[Block spacing — Section C]

#(layout.text-3)[
  All derived as `leading-body-b2b × ratio^k`, then converted to Typst gap. Exponent encodes hierarchy: k=−1 minor, k=0 standard, k=1 heading, k=2 section.
]

#(layout.text-2)[
  paragraph (k=0): #style.global.spacing.paragraph \
  list-item (k=−1): #style.global.spacing.list-item \
  heading-above (k=1): #style.global.spacing.heading-above \
  heading-below (k=−1): #style.global.spacing.heading-below \
  section-above (k=2): #style.global.spacing.section-above \
  section-below (k=1): #style.global.spacing.section-below
]

#(layout.h3)[h3 demonstration]

Paragraph after h3. The gap above this h3 was `heading-above`; the gap below was `heading-below`. Note heading-below is tighter than heading-above — spec convention: headings attach to following content.

Second paragraph, separated by `space-paragraph` (= leading-body). Lorem ipsum dolor sit amet.

#(layout.h3)[Another h3]

Body after another h3. The first paragraph after a heading is never indented even if `first-line-indent` is set.

// === Page geometry ===
#(layout.h2)[Page geometry — Section G]

#(layout.text-3)[
  Spec: content area is similar to page (same aspect ratio). Both margin pairs split by `ratio` (asymmetric book canon — outer/inner = bottom/top = ratio).
]

#(layout.text-2)[
  measure-target: *#demo-measure* chars \
  content-width: *#scale.measure-width-for(style.global.doc.text.font, measure: demo-measure)* \
  margin-inner: *#style.global.margins.inner* \
  margin-outer: *#style.global.margins.outer* \
  margin-top: *#style.global.margins.top* \
  margin-bottom: *#style.global.margins.bottom*
]

// === Indents ===
#(layout.h2)[Indents — Section D]

#(layout.text-3)[
  All indents are `ms(n)` values:\
  indent-first-line: #indent-first-line (ms(2)) \
  indent-list: #indent-list (ms(1)) \
  indent-quote: #indent-quote (ms(2))
]

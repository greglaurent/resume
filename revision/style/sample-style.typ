#import "scale.typ": size-small, size-h1, size-h2, size-h3, size-h4, figure-placeholder-height, space-heading-above, space-heading-below, tracking-display
#import "template.typ": doc, lead, cap

#show: doc.with(title: "Element Test")

// Prose heading sizes — format-specific, not in template.typ
show heading.where(level: 1): set text(size: size-h1, tracking: tracking-display)
show heading.where(level: 1): set block(above: space-heading-above, below: space-heading-below)
show heading.where(level: 2): set text(size: size-h2)
show heading.where(level: 2): set block(above: space-heading-above, below: space-heading-below)
show heading.where(level: 3): set text(size: size-h3)
show heading.where(level: 3): set block(above: space-heading-above, below: space-heading-below)
show heading.where(level: 4): set text(size: size-h4)
show heading.where(level: 4): set block(above: space-heading-above, below: space-heading-below)

// ─── HEADINGS ────────────────────────────────────────────────────────────────

= Heading One — Lorem Ipsum Dolor Sit Amet

== Heading Two — Lorem Ipsum Dolor Sit Amet

=== Heading Three — Lorem Ipsum Dolor Sit Amet

==== Heading Four — Lorem Ipsum Dolor Sit Amet

// ─── BODY TEXT ───────────────────────────────────────────────────────────────

== Body Text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem.

// ─── LEAD PARAGRAPH ──────────────────────────────────────────────────────────

== Lead Paragraph

#lead[
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
]

// ─── SMALL TEXT ──────────────────────────────────────────────────────────────

== Small Text

#text(size: size-small)[
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
]

// ─── CAPTION TEXT ────────────────────────────────────────────────────────────

== Caption Text

#cap[
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.
]

// ─── LIST ────────────────────────────────────────────────────────────────────

== List

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

- Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua
- Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
- Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
- Excepteur sint occaecat cupidatat non proident, sunt in culpa

// ─── HEADING FOLLOWED BY LIST (the spacing case) ─────────────────────────────

=== Heading Three Directly Above a List

- Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua
- Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
- Duis aute irure dolor in reprehenderit in voluptate velit esse cillum

// ─── BLOCK QUOTE ─────────────────────────────────────────────────────────────

== Block Quote

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

#quote(block: true)[
  Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.

  — Lorem Ipsum, _De Finibus Bonorum et Malorum_
]

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

// ─── FIGURE WITH CAPTION ─────────────────────────────────────────────────────

== Figure with Caption

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

#figure(
  rect(width: 100%, height: figure-placeholder-height, fill: luma(230)),
  caption: [Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.],
)

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

// ─── CODE BLOCK ──────────────────────────────────────────────────────────────

== Code Block

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

```typst
#let base-size = 11pt
#let ratio     = 1.25
#let ms(n)     = base-size * calc.pow(ratio, n)

#let size-body = ms(0)   // 11pt
#let size-h1   = ms(4)   // ~26.9pt
```

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

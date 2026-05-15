#import "style/layout.typ" as layout

// Landscape, narrow margins → maximize horizontal room for side-by-side scales.
#set page(paper: "us-letter", margin: 0.4in, flipped: true)
#set text(size: 9pt)

#let scales = (
  "classical",
  "major-third",
  "minor-third",
  "tritonic",
  "tetratonic",
  "golden-ditonic",
  "golden-ratio",
)

#let sample(name) = {
  let l = layout.make(scale: name, measure: 35)
  block(width: 100%, breakable: true)[
    #text(size: 10pt, weight: 700, font: "Libertinus Serif", fill: rgb("#0050a8"))[#name]
    #v(0.4em)
    #(l.heading-1)[Heading 1]
    #(l.heading-2)[Heading 2]
    #(l.heading-3)[Heading 3]
    #(l.heading-4)[Heading 4]
    #(l.text-5)[Text 5 (subhead)]
    #(l.text-4)[Text 4 (subhead)]
    #(l.text-1)[Body — quick brown fox.]
    #(l.text-2)[Text 2 (small)]
    #(l.text-3)[Text 3 (caption)]
  ]
}

= Typographic Scale Comparison

#v(0.5em)

All samples use the same 11pt body, same font (Libertinus Serif), same theme.
The only difference between columns is the `scale:` parameter. Heading
sizes derive from `f₀ × r^(i/n)` per Mortensen's formula.

#v(1em)

#grid(
  columns: 4,
  rows: auto,
  column-gutter: 1.5em,
  row-gutter: 1.5em,
  ..scales.map(sample),
)

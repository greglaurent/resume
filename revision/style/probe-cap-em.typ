// Probe cap-em for fonts. Add font names to the list below and run:
//   typst compile probe-cap-em.typ
// Then copy the printed values into the cap-em registry in style/scale.typ.
//
// cap-em = (cap-height in pt at size S) / S
// Measured with top-edge: "cap-height" + bottom-edge: "baseline" — these
// edges read the font's true sCapHeight via the OS/2 table.

#let fonts = (
  "EB Garamond",
  "Source Serif 4",
  // add more here
)

#let probe(font) = context {
  let h = measure(text(font: font, size: 100pt, top-edge: "cap-height", bottom-edge: "baseline")[H]).height
  [#font: #(h / 100pt) \ ]
}

#set text(size: 12pt, font: "DejaVu Sans Mono")
#set page(margin: 1in)

= Cap-em probe

#for f in fonts { probe(f) }

#v(1em)

#text(size: 9pt)[
  Add new fonts to the `fonts` array above and recompile. Copy the printed
  values into `cap-em = (...)` in `style/scale.typ`. Use `H` as the probe
  glyph (flat top, no overshoot).
]

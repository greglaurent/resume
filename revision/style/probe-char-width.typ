// Probe average char-width (em) for fonts. Add font names to the list below
// and run:
//   typst compile style/probe-char-width.typ
// Then copy the printed values into the char-width registry in style/scale.typ.
//
// char-width = (width of "abcdefghijklmnopqrstuvwxyz" at size S) / S / 26
// Lowercase alphabet at large size: most prose is lowercase, so the average
// over a-z is representative of running-text measure.

#let fonts = (
  "EB Garamond",
  "Source Serif 4",
  // add more here
)

#let probe(font) = context {
  let alpha = "abcdefghijklmnopqrstuvwxyz"
  let w = measure(text(font: font, size: 100pt)[#alpha]).width
  [#font: #(w / 100pt / 26) \ ]
}

#set text(size: 12pt, font: "DejaVu Sans Mono")
#set page(margin: 1in)

= Char-width probe

#for f in fonts { probe(f) }

#v(1em)

#text(size: 9pt)[
  Add new fonts to the `fonts` array above and recompile. Copy the printed
  values into `char-width = (...)` in `style/scale.typ`. Values are in em
  (average glyph advance over lowercase a-z).
]

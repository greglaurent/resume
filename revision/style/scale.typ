// === INPUTS ===
// Change these two values. Everything else moves proportionally.
#let base-size = 11pt
#let ratio = 1.25  // major third; try 1.2 (minor third), 1.333 (perfect fourth), 1.618 (golden)

// === CORE SCALE FUNCTION ===
// ms(n) = base-size * ratio^n
// ms(0)  = base-size (body)
// ms(n)  = larger for n > 0, smaller for n < 0
// Do not call ms() in document files — use the named roles below.
#let ms(n) = base-size * calc.pow(ratio, n)

// === FONT SIZES ===
// Named semantic roles. Documents reference these names, never raw ms() calls.
#let size-caption = ms(-2)
#let size-small   = ms(-1)
#let size-body    = ms(0)
#let size-lead    = ms(1)   // lede paragraphs, pull quotes
#let size-h4      = ms(1)
#let size-h3      = ms(2)
#let size-h2      = ms(3)
#let size-h1      = ms(4)
#let size-display = ms(5)

// === VERTICAL RHYTHM ===
// Em units self-adjust: 1.4em at size-body yields a different absolute value than
// 1.4em at size-h1. This is intentional — leading scales with the text it spaces.
// Do not convert these to pt. See: https://typst.app/docs/reference/layout/length/
#let leading-body  = 1.4em   // body, lists
#let leading-tight = 1.15em  // headings — tighter for display type
#let leading-loose = 1.6em   // captions, footnotes — looser for small text

// === BLOCK SPACING ===
// All derived from leading-body, which is itself derived from font size via em.
// One rhythm unit = one line of body leading. Headings get 1.5 lines above, 0.5 below
// (3:1 ratio associates heading visually with the section it introduces).
#let space-paragraph    = leading-body          // inter-paragraph gap
#let space-heading-above = leading-body * 1.5   // 1.5 rhythm units before a heading
#let space-heading-below = leading-body * 0.5   // 0.5 rhythm units after a heading
#let space-block        = leading-body          // figures, code blocks, block quotes

// === INDENTS AND HORIZONTAL RHYTHM ===
#let indent-first-line = ms(2)   // first-line paragraph indent
#let indent-list       = ms(1)   // list left indent
#let indent-quote      = ms(2)   // block quote left and right inset

// === TRACKING ===
// Inversely proportional to size: large display type needs tighter tracking;
// small captions need looser tracking to remain legible.
#let tracking-display = -0.02em
#let tracking-caption =  0.04em

// === PAGE GEOMETRY ===
// Margins anchored to the scale. At 11pt / 1.25:
//   ms(6) ≈ 42pt ≈ 0.58 in  (inner / top)
//   ms(7) ≈ 52pt ≈ 0.72 in  (outer / bottom)
#let margin-inner  = ms(6)
#let margin-outer  = ms(7)
#let margin-top    = ms(6)
#let margin-bottom = ms(7)

// === FIGURE PLACEHOLDER ===
// Named so document.typ can dimension a placeholder without a literal.
#let figure-placeholder-height = ms(7)

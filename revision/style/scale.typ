// === INPUTS ===
// Two values drive the entire scale. Change either and everything moves
// proportionally — sizes, leadings, trackings, indents, margins, spacings.
#let base = 12pt
#let ratio = 1.25  // 1.2 minor third, 1.25 major third, 1.333 perfect fourth, 1.618 golden

// === ANCHOR CONSTANTS — TYPST-BOUND ===
// Cap-em registry, measured per font via measure() probe.
//   context { measure(text(font: F, size: 100pt, top-edge: "cap-height", bottom-edge: "baseline")[H]).height / 100pt }
// Anchor constant; expand manually as fonts are introduced.
#let cap-em = (
  "EB Garamond": 0.65,
  "Source Serif 4": 0.67,
)
#let default-cap-em = cap-em.at("EB Garamond")

// Top/bottom edge convention. Locked to cap-height / baseline; the cap-em
// conversion in Section B assumes this. Changing requires recomputing cap-em
// values and the gap formula.
#let text-top-edge = "cap-height"
#let text-bottom-edge = "baseline"

// === ANCHOR CONSTANTS — TYPOGRAPHIC ===
// Measure target — Bringhurst/Tschichold legibility optimum.
#let measure-target = 66

// Reading-continuity thresholds (Section H). Typst lacks native widow/orphan
// enforcement; surfaced for downstream use when it lands.
#let widows-min = 2
#let orphans-min = 2
#let heading-keep-with-next = 2
#let caption-keep-with-figure = true

// Hyphenation thresholds (Section F) — linguistic, not scale-dependent.
// Typst does not expose min-pre/min-post/max-consecutive at the language layer;
// surfaced for completeness.
#let hyphenation-enabled = true
#let hyphenation-min-word-length = 5
#let hyphenation-min-pre = 2
#let hyphenation-min-post = 3

// === MATHEMATICAL SCALE ===
// ms(n) = base × ratio^n. n = 0 returns base; positive n grows, negative shrinks.
#let ms(n) = base * calc.pow(ratio, n)

// === SECTION A — FONT SIZES ===
// Every font size is ms(n) for an integer n. No exceptions, no × 0.92 shortcuts.
#let size-micro = ms(-3)
#let size-caption = ms(-2)
#let size-small = ms(-1)
#let size-body = ms(0)
#let size-lead = ms(1)
#let size-h6 = ms(0)
#let size-h5 = ms(1)
#let size-h4 = ms(1)
#let size-h3 = ms(2)
#let size-h2 = ms(3)
#let size-h1 = ms(4)
#let size-display = ms(5)
#let size-giant = ms(6)

// Code and math sizes. Code occupies the next step down to compensate for
// monospaced fonts' larger x-height (per spec — not a × 0.92 fudge).
#let size-code-inline = ms(-1)
#let size-code-block = ms(-1)
#let size-math-inline = ms(0)

// === SECTION B — LEADING ===
// Spec defines leading as a baseline-to-baseline (b2b) multiplier:
//   leading_body  = 1em + (ratio − 1) × 2em      (k=2)
//   leading_tight = 1em + (ratio − 1) × 1em      (k=1)  — large headings, display
//   leading_loose = 1em + (ratio − 1) × 3em      (k=3)  — captions, footnotes
// The integers {1, 2, 3} are role differentiators (anchor constants).
//
// Typst's par.leading is the *gap* between line edges, not b2b. With
// top-edge/bottom-edge set to cap-height/baseline, the line block height is
// (cap-em × 1em). Conversion:
//   par.leading = b2b − cap-em × 1em
#let _b2b-body = 1em + (ratio - 1) * 2em
#let _b2b-tight = 1em + (ratio - 1) * 1em
#let _b2b-loose = 1em + (ratio - 1) * 3em

#let _gap(b2b, cap-em) = b2b - cap-em * 1em

// Per-font factories — call with the font's cap-em from the registry.
#let leading-body-for(cap-em) = _gap(_b2b-body, cap-em)
#let leading-tight-for(cap-em) = _gap(_b2b-tight, cap-em)
#let leading-loose-for(cap-em) = _gap(_b2b-loose, cap-em)

// Module-level constants — computed against the default font's cap-em.
// Stylesheet overrides referencing these get the default-font value;
// regions using a different font get the correct value via style.global,
// which set-style resolves per-region from the font in doc.text.font.
#let leading-body = leading-body-for(default-cap-em)
#let leading-tight = leading-tight-for(default-cap-em)
#let leading-loose = leading-loose-for(default-cap-em)

// Per-step aliases — keep the current naming style. Spec role assignment:
//   body, lead, h3-h6 → leading-body
//   h1, h2, display, giant → leading-tight
//   small, caption, micro → leading-loose
#let leading-h1 = leading-tight
#let leading-h2 = leading-tight
#let leading-h3 = leading-body
#let leading-h4 = leading-body
#let leading-h5 = leading-body
#let leading-h6 = leading-body
#let leading-display = leading-tight
#let leading-giant = leading-tight
#let leading-lead = leading-body
#let leading-small = leading-loose
#let leading-caption = leading-loose
#let leading-micro = leading-loose

// === SECTION C — BLOCK SPACING ===
// All block spacing derives from leading-body × ratio^k. Exponent encodes
// hierarchical depth:
//   k = -1 — minor separators (list items, caption gap, subheading below)
//   k =  0 — standard separators (paragraph, block, quote)
//   k =  1 — heading-level separators
//   k =  2 — section/chapter-level separators
// Apply spec formula in b2b space, then convert to Typst gap once
// (the cap-em offset doesn't distribute through × ratio).
#let space-paragraph-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-block-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-quote-above-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-quote-below-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-subheading-above-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-subheading-below-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, -1), cap-em)
#let space-list-item-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, -1), cap-em)
#let space-list-above-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, -1), cap-em)
#let space-list-below-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, -1), cap-em)
#let space-caption-gap-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, -1), cap-em)
#let space-heading-above-for(cap-em) = _gap(_b2b-body * ratio, cap-em)
#let space-heading-below-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, -1), cap-em)
#let space-figure-above-for(cap-em) = _gap(_b2b-body * ratio, cap-em)
#let space-figure-below-for(cap-em) = _gap(_b2b-body * ratio, cap-em)
#let space-code-above-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-code-below-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-table-above-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-table-below-for(cap-em) = _gap(_b2b-body, cap-em)
#let space-section-above-for(cap-em) = _gap(_b2b-body * calc.pow(ratio, 2), cap-em)
#let space-section-below-for(cap-em) = _gap(_b2b-body * ratio, cap-em)

// Module-level constants against the default font's cap-em.
#let space-paragraph = space-paragraph-for(default-cap-em)
#let space-block = space-block-for(default-cap-em)
#let space-quote-above = space-quote-above-for(default-cap-em)
#let space-quote-below = space-quote-below-for(default-cap-em)
#let space-subheading-above = space-subheading-above-for(default-cap-em)
#let space-subheading-below = space-subheading-below-for(default-cap-em)
#let space-list-item = space-list-item-for(default-cap-em)
#let space-list-above = space-list-above-for(default-cap-em)
#let space-list-below = space-list-below-for(default-cap-em)
#let space-caption-gap = space-caption-gap-for(default-cap-em)
#let space-heading-above = space-heading-above-for(default-cap-em)
#let space-heading-below = space-heading-below-for(default-cap-em)
#let space-figure-above = space-figure-above-for(default-cap-em)
#let space-figure-below = space-figure-below-for(default-cap-em)
#let space-code-above = space-code-above-for(default-cap-em)
#let space-code-below = space-code-below-for(default-cap-em)
#let space-table-above = space-table-above-for(default-cap-em)
#let space-table-below = space-table-below-for(default-cap-em)
#let space-section-above = space-section-above-for(default-cap-em)
#let space-section-below = space-section-below-for(default-cap-em)

// === SECTION D — INDENTS ===
#let indent-first-line = ms(2)
#let indent-list = ms(1)
#let indent-list-nested = ms(1)
#let indent-quote = ms(2)
#let indent-hanging = ms(1)

// === SECTION E — TRACKING ===
// Spec: tracking magnitude = (ratio − 1) × differentiator × 1em.
// Sign negative for large sizes (tighten), positive for small (loosen).
// Body and lead are never tracked.
// Differentiators {1/8, 1/4, 1/3, 1/2, 2/3} are anchor constants.
#let tracking-body = 0em
#let tracking-lead = 0em

#let tracking-h-small = (ratio - 1) * (-1 / 8) * 1em   // h4, h5, h6
#let tracking-h-large = (ratio - 1) * (-1 / 4) * 1em   // h1, h2, h3
#let tracking-display = (ratio - 1) * (-1 / 3) * 1em   // display, giant
#let tracking-giant = (ratio - 1) * (-1 / 3) * 1em

#let tracking-small = (ratio - 1) * (1 / 8) * 1em
#let tracking-caption = (ratio - 1) * (1 / 4) * 1em
#let tracking-micro = (ratio - 1) * (1 / 3) * 1em

#let tracking-smallcaps = (ratio - 1) * (1 / 2) * 1em
#let tracking-allcaps = (ratio - 1) * (2 / 3) * 1em

// Per-step aliases — spec role assignment.
#let tracking-h1 = tracking-h-large
#let tracking-h2 = tracking-h-large
#let tracking-h3 = tracking-h-large
#let tracking-h4 = tracking-h-small
#let tracking-h5 = tracking-h-small
#let tracking-h6 = tracking-h-small

// === SECTION G — PAGE GEOMETRY ===
// Spec: measure drives geometry. Content area is similar to the page (same
// aspect ratio), and both margin pairs split by ratio (classical book canon):
//
//   content_width  = measure-target × char-width(font) × base
//   content_height = content_width × (page_height / page_width)
//   total_h        = page_width  − content_width
//   total_v        = page_height − content_height
//   inner          = total_h / (1 + ratio)
//   outer          = total_h × ratio / (1 + ratio)
//   top            = total_v / (1 + ratio)
//   bottom         = total_v × ratio / (1 + ratio)
//
// content_height is derived from page aspect ratio (a ratio between two role
// values already defined — the page dimensions). No invented multipliers.

// Paper dimensions registry. Add entries as new papers are introduced.
#let paper-dimensions = (
  "us-letter": (width: 8.5in, height: 11in),
  "a4": (width: 210mm, height: 297mm),
  "legal": (width: 8.5in, height: 14in),
)
#let default-paper = "us-letter"

// Char-width registry — average glyph advance in em (lowercase a-z, divided).
// Probe via measure() — see style/probe-char-width.typ. Add manually per font.
#let char-width = (
  "EB Garamond": 0.437,
  "Source Serif 4": 0.508,
)
#let default-char-width = char-width.at("EB Garamond")

#let _resolve-char-width(font) = if font in char-width { char-width.at(font) } else { default-char-width }
#let _resolve-paper-dims(paper) = paper-dimensions.at(paper)

// Content width: measure × char-width × base. `measure` is target chars/line.
// Defaults to scale.measure-target (66, book canon); regions override per
// document type (resume tighter, book at default, etc.).
#let measure-width-for(font, measure: measure-target) = measure * _resolve-char-width(font) * base

// Spec Section G applied. `measure` and `margin-style` overrideable per region.
// margin-style:
//   "single" — symmetric layout. left = right = total_h/2 from measure-driven
//              content width; top = bottom = ms(6) (scale-anchored vertical).
//              Suited to single-sided documents (resumes, articles, web).
//   "book"   — classical asymmetric canon. inner/outer split by ratio;
//              content area is similar to page (content_height = content_width
//              × page_aspect), top/bottom split by ratio. Suited to bound
//              books with facing pages.
// The returned dict always uses inner/outer/top/bottom keys; style.typ maps
// inner→left, outer→right at the Typst page margin.
#let margins-for(paper, font, measure: measure-target, margin-style: "single") = {
  let dims = _resolve-paper-dims(paper)
  let m-width = measure-width-for(font, measure: measure)
  let total-h = dims.width - m-width
  if margin-style == "book" {
    let m-height = m-width * (dims.height / dims.width)
    let total-v = dims.height - m-height
    (
      inner: total-h / (1 + ratio),
      outer: total-h * ratio / (1 + ratio),
      top: total-v / (1 + ratio),
      bottom: total-v * ratio / (1 + ratio),
    )
  } else {
    let half-h = total-h / 2
    let v = ms(6)
    (
      inner: half-h,
      outer: half-h,
      top: v,
      bottom: v,
    )
  }
}

// Module-level constants against default paper + default font + default
// measure-target, for stylesheet ergonomics. Per-region margins are computed
// inside set-style from the region's actual paper, font, and measure-target.
#let _default-margins = margins-for(default-paper, "EB Garamond")
#let margin-inner = _default-margins.inner
#let margin-outer = _default-margins.outer
#let margin-top = _default-margins.top
#let margin-bottom = _default-margins.bottom

// Default paper alias (preserves the old name for any consumer importing it).
#let page-paper = default-paper

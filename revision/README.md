# Modular Type System

Two inputs drive the entire document. Everything else is derived.

## Inputs (`scale.typ`)

```typst
#let base-size = 11pt   // body font size
#let ratio = 1.25       // scale ratio (major third)
```

Change either value and recompile. No other edits are needed.

## What propagates

| Category | How it derives |
|---|---|
| All font sizes | `ms(n) = base-size × ratio^n` at integer steps −2 through +5 |
| Line leading | `1.4em` (body), `1.15em` (headings), `1.6em` (captions) — em tracks current font size |
| Paragraph spacing | `leading-body × 1.0` |
| Heading spacing above | `leading-body × 1.5` |
| Heading spacing below | `leading-body × 0.5` |
| Figure / code / quote gutters | `leading-body × 1.0` |
| First-line indent | `ms(2)` |
| List indent | `ms(1)` |
| Block quote inset | `ms(2)` |
| Page margins (inner/top) | `ms(6)` |
| Page margins (outer/bottom) | `ms(7)` |

## Ratio presets

| Name | Value | Character |
|---|---|---|
| Minor third | 1.2 | Compact; subtle size steps |
| Major third | 1.25 | Default; clear hierarchy |
| Perfect fourth | 1.333 | Strong; noticeable jumps |
| Golden ratio | 1.618 | Dramatic; large headings |

## Named size roles

| Name | Step | ~pt at 11pt/1.25 |
|---|---|---|
| `size-caption` | −2 | 7.0 pt |
| `size-small` | −1 | 8.8 pt |
| `size-body` | 0 | 11.0 pt |
| `size-lead` / `size-h4` | 1 | 13.75 pt |
| `size-h3` | 2 | 17.2 pt |
| `size-h2` | 3 | 21.5 pt |
| `size-h1` | 4 | 26.9 pt |
| `size-display` | 5 | 33.6 pt |

## Usage

Documents import only from `template.typ`:

```typst
#import "template.typ": doc, lead, cap
#show: doc.with(title: "My Document")

= Heading One

#lead[Lede paragraph at one step above body size.]

Body text. No numeric length literals here.
```

The `lead` function sets `size-lead`. The `cap` function sets `size-caption` with loose leading. All other typographic decisions are applied by `doc()`.

## Acceptance tests

1. **Scale propagation.** Change `base-size` to `13pt`, recompile. Every element grows. Change `ratio` to `1.5`, recompile. Heading sizes increase dramatically; body stays at `13pt`.
2. **No literals.** `grep -E '[0-9]+(pt|mm|cm|in)' document.typ` returns nothing.
3. **Size check.** At `11pt / 1.25`, body renders at 11 pt and h1 at `11 × 1.25^4 ≈ 26.9 pt`.

## Rules

- Numeric length literals belong only in `scale.typ`.
- Documents reference named roles (`size-h2`, `space-block`), never raw `ms()` calls.
- New typographic roles go into `scale.typ` as named values before being used anywhere.

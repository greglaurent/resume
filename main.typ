#import "@local/cascade:0.1.0": layout
#import "@preview/fontawesome:0.5.0": fa-envelope, fa-github, fa-linkedin, fa-location-dot, fa-mobile-screen-button

#import "content/masthead.typ"
#import "content/summary.typ": summary
#import "content/experience.typ": experience
#import "content/education.typ": education
#import "content/clearance.typ": clearance

#import "formats/us/apply.typ": apply

#let l = layout.make(
  theme: layout.theme.presets.light,
  theme-overrides: (bg: white),
  measure: 85,
  base: 12pt,
  scale: "golden-ditonic",
  page: (paper: "us-letter", numbering: none),
  overrides: (
    list: (tight: true),
    enum: (tight: true),
  ),
)

// Extend `l` with icons config (mirrors the old layout.icons).
#let l = (
  ..l,
  icons: (
    font: "Font Awesome 7 Free Solid",
    envelope: fa-envelope,
    github: fa-github,
    linkedin: fa-linkedin,
    location: fa-location-dot,
    phone: fa-mobile-screen-button,
  ),
)

#let data = (
  masthead: (
    name: masthead.name.first-initial-last,
    subtitle: masthead.subtitle,
    phone: masthead.phone.mobile-us,
    email: masthead.email.business,
    location: masthead.location.city-state,
  ),
  summary: summary,
  experience: experience,
  education: education,
  clearance: clearance,
)

#show: l.page
#show: l.markup
#apply(l, data)

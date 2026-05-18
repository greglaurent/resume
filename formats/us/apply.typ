#import "@local/cascade:0.1.0": layout
#import "@preview/fontawesome:0.5.0": fa-envelope, fa-github, fa-linkedin, fa-location-dot, fa-mobile-screen-button

#import "masthead.typ": render-masthead
#import "summary.typ": render-summary
#import "experience.typ": render-experience
#import "education.typ": render-education
#import "clearance.typ": render-clearance

#let apply() = {
  let l = layout.make(
    theme: layout.theme.presets.light,
    theme-overrides: (bg: white),
    measure: 66,
    base: 12pt,
    //font: "EB Garamond",
    fonts: (
      body: (family: "Quattrocento Sans", size: 11.5pt),
      heading: (family: "Quattrocento"),
    ),
    scale: "golden-ditonic",
    page: (paper: "us-letter", numbering: none),
    //overrides: (
    //list: (tight: true),
    //enum: (tight: true),
    //),
  )

  let l = (
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

  //let data = (
  //  masthead: (
  //    name: masthead.name.first-initial-last,
  //    subtitle: masthead.subtitle,
  //    phone: masthead.phone.mobile-us,
  //    email: masthead.email.business,
  //    location: masthead.location.city-state,
  //  ),
  //  summary: summary,
  //  experience: experience,
  //  education: education,
  //  clearance: clearance,
  //)

  let body = {
    render-masthead(l)
    render-summary(l)
    render-experience(l)

    grid(
      columns: (3fr, 2fr),
      gutter: 1.5em,
      render-education(l), render-clearance(l),
    )
  }

  (l.page)((l.markup)(body))
}

#import "content/masthead.typ": email, location, name, phone, subtitle
#import "content/experience.typ": experience
#import "content/education.typ": education
#import "content/summary.typ": summary
#import "content/solution-driven.typ": solution-driven
#import "content/holistic-approach.typ": holistic-approach
#import "content/clearance.typ": clearance

#let set-content(
  name-val: name.first-initial-last,
  phone-val: phone.mobile-us,
  email-val: email.business,
  location-val: location.city-state,
) = (
  name: name-val,
  subtitle: subtitle,
  phone: phone-val,
  email: email-val,
  location: location-val,
  summary: summary,
  experience: experience,
  education: education,
  solution-driven: solution-driven,
  holistic-approach: holistic-approach,
  clearance: clearance,
)

#let content = (
  us: set-content(),
  cv: set-content(name-val: name.first-last, location-val: location.city-state-country),
)

#let get-content(region) = content.at(region)

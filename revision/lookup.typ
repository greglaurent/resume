#import "content/header.typ": email, location, name, phone
#import "content/experience.typ": experience
#import "content/summary.typ": summary

#let set-content(
  name-val: name.first-initial-last,
  phone-val: phone.mobile-us,
  email-val: email.business,
  location-val: location.city-state,
) = (
  name: name-val,
  phone: phone-val,
  email: email-val,
  location: location-val,
  summary: summary,
  experience: experience,
)

#let content = (
  us: set-content(),
  cv: set-content(name-val: name.first-last, location-val: location.city-state-country),
)

#let get-content(region) = content.at(region)

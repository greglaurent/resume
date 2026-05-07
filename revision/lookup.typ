#let name = (
  first-last: [ Gregory Laurent ],
  first-middle-last: [ Gregory Marc Laurent ],
  first-initial-last: [ Gregory M. Laurent ],
)

#let phone = (
  mobile-us: [ 775.300.9291 ],
  mobile-int: [ +1 775.300.9291 ],
)

#let email = (
  business: [ greg@abmac.io ],
  personal: [ gregory.m.laurent@gmail.com ],
)

#let location = (
  city-state: [ Reno, NV ],
  city-state-country: [ Reno, NV, US ],
)

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
)

#let content = (
  us: set-content(),
  cv: set-content(name-val: name.first-last, location-val: location.city-state-country),
)

#let get-content(region) = content.at(region)

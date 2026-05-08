#import "formats/us/apply.typ": apply as us-apply
#import "formats/cv/apply.typ": apply as cv-apply

#let appliers = (
  us: us-apply,
  cv: cv-apply,
)

#let get-apply(region) = appliers.at(region)

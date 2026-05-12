// "us", "cv"
#let region = "us"

#import "lookup.typ": get-content
#import "format.typ": get-apply
#import "style/template.typ": doc

#let data = get-content(region)
#let apply = get-apply(region)

#show: doc
#show: body => apply(body, data)

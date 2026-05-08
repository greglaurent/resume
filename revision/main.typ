// "us", "cv"
#let region = "us"

#import "lookup.typ": get-content
#import "style.typ": get-style
#import "format.typ": get-apply

#let data = get-content(region)
#let style = get-style(region)
#let apply = get-apply(region)

#show: doc => apply(doc, style, data)

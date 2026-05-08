// "us", "cv"
#let region = "cv"

#import "lookup.typ": get-content
#import "style.typ": get-style
#import "formats.typ": get-apply

#let data = get-content(region)
#let style = get-style(region)
#let apply = get-apply(region)

#show: doc => apply(doc, style, data)

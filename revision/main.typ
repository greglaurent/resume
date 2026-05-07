// "us", "cv"
#let region = "us"
#import "style.typ": get-format
#import "lookup.typ": get-content

#let data = get-content(region)
#let style = get-format(region)

#show: doc => style(doc, data)

#import "formats/us/apply.typ" as us

#let formats = (us: us)
#let format = sys.inputs.at("format", default: "us")
#let name = sys.inputs.at("file-name", default: "Gregory_Laurent")
#let output = sys.inputs.at("output", default: "output")

#set document(title: name)
#(formats.at(format).apply)()

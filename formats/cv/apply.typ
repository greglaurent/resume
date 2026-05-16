#import "header.typ": build-header
#import "sections.typ": experience-section

#let apply(content, style, data) = {
  show: (style.doc.par)
  show: (style.doc.text)
  show: doc => (style.doc.page)(doc, header: build-header(data, style))

  experience-section(data.experience, style)
  content
}

#let experience-section(entries, style) = {
  heading(level: 2)[Experience]
  for entry in entries {
    [
      #text(weight: 700)[#entry.company], #emph[#entry.location] \
      #entry.role #h(1fr) #entry.start – #entry.end
    ]
    for bullet in entry.bullets [
      - #bullet
    ]
    v(1em)
  }
}

#let experience-section(entries, style) = {
  heading(level: 2)[Experience]
  for entry in entries {
    [
      *#entry.company* — #entry.role #h(1fr) #entry.start – #entry.end
    ]
    for bullet in entry.bullets [
      - #bullet
    ]
    v(0.5em)
  }
}

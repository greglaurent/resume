#let render-solution-driven(bullets, style) = {
  (style.solution-driven.heading)[Solution-driven]
  set text(
    size: style.global.bullet.size,
    tracking: style.global.bullet.tracking,
    weight: style.global.bullet.weight,
  )
  for bullet in bullets [
    - #bullet
  ]
}

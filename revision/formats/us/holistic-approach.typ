#let render-holistic-approach(bullets, style) = {
  (style.holistic-approach.heading)[Holistic Approach]
  set text(
    size: style.global.bullet.size,
    tracking: style.global.bullet.tracking,
    weight: style.global.bullet.weight,
  )
  for bullet in bullets [
    - #bullet
  ]
}

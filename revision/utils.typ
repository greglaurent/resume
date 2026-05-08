#let set-text(body, size, tracking, weight) = {
  text(
    body,
    size: size,
    tracking: tracking,
    weight: weight,
  )
}

#let set-smallcaps(body, size, tracking, weight) = {
  smallcaps(
    set-text(body, size, tracking, weight),
  )
}


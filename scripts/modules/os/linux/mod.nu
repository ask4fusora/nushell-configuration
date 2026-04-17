export def --wrapped linux-cb [...rest] {
  error make {msg: "`cb` is not implemented for Linux yet."}
}

export def --wrapped linux-sudo [...rest] {
  ^sudo ...$rest
}

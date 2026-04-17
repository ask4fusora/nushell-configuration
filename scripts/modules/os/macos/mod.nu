export def --wrapped macos-cb [...rest] {
  error make {msg: "`cb` is not implemented for macOS yet."}
}

export def --wrapped macos-sudo [...rest] {
  ^sudo ...$rest
}

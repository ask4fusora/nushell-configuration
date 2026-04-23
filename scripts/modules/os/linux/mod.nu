export def --wrapped linux-cb [...rest] {
  error make {msg: "`cb` is not implemented for Linux yet."}
}

export def --wrapped linux-sudo [...rest] {
  if ($rest | is-empty) { ^sudo nu } else { ^sudo nu -c ($rest | str join ' ') }
}

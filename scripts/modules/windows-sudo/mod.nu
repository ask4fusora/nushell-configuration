export def --wrapped sudo [...rest] {
  if ($rest | is-empty) { ^sudo nu } else { ^sudo nu -c ($rest | str join ' ') }
}

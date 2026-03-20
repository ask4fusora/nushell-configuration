export def --wrapped wsudo [...rest] {
  if ($rest | is-empty) { ^sudo nu } else { ^sudo nu -c ($rest | str join ' ') }
}

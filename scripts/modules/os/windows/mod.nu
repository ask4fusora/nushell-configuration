export alias windows-cb = ^win32yank

export def --wrapped windows-sudo [...rest] {
  if ($rest | is-empty) { ^sudo nu } else { ^sudo nu -c ($rest | str join ' ') }
}

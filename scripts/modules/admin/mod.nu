export def elevate [] {
  require-executable sudo

  ^sudo nu
}

export def --wrapped sudo [...args] {
  require-executable sudo

  let command = $args | str join ' '

  ^sudo nu -c $command
}

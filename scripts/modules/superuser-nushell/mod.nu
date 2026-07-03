export def elevate [] {
  ^sudo nu
}

export def --wrapped sudo [...args] {
  let command = $args | str join ' '
  ^sudo nu -c $command
}

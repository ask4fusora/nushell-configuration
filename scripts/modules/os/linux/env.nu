export def --env install-linux-env [] {
  let home = '~' | path expand
  let cargo_bin = $home | path join ".cargo" "bin"
  let local_bin = $home | path join ".local" "bin"

  $env.PATH = (
    $env.PATH
    | prepend [
      $cargo_bin,
      $local_bin
    ]
    | uniq
  )
}

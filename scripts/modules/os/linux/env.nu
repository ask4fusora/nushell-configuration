export def --env install-linux-env [] {
  let home = '~' | path expand
  let cargo_bin = $home | path join ".cargo" "bin"

  $env.PATH = (
    $env.PATH
    | append [
      $cargo_bin
    ]
    | uniq
  )
}

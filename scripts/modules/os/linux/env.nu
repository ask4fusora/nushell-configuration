export def --env install-linux-env [] {
  let home = '~' | path expand

  let cargo_bin = $home | path join ".cargo" "bin"

  let local_bin = $home | path join ".local" "bin"

  $env.VOLTA_HOME = $home | path join ".volta"
  let volta_bin = $env.VOLTA_HOME | path join "bin"

  $env.PATH = (
    $env.PATH
    | prepend [
      $cargo_bin,
      $local_bin,
      $volta_bin
    ]
    | uniq
  )
}

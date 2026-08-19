export def --env install-windows-env [] {
  require-executable scoop

  let git_root = (scoop prefix git)

  let git_bin = $git_root | path join "usr" "bin"

  $env.PATH = (
    $env.PATH
    | prepend [
      $git_bin
    ]
    | uniq
  )
}

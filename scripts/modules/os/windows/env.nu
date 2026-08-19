export def --env install-windows-env [] {
  require-executable scoop

  let git_bin = (
    which git
    | first
    | get path
    | path dirname
    | path join .. usr bin
  )

  $env.PATH = (
    $env.PATH
    | prepend [
      $git_bin
    ]
    | uniq
  )
}

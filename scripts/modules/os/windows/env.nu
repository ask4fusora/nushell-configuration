export def --env install-windows-env [] {
  require-executable scoop

  let git_bin = (
    which git
    | first
    | get path
    | path dirname
    | path join .. usr bin
    | path expand -n
  )

  $env.PATH = (
    $env.PATH
    | append [
      $git_bin
    ]
    | uniq
  )
}

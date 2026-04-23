export def --env install-linux-env [] {
  let cargo_bin = $env.HOME | path join ".cargo" "bin"

  $env.PATH = (
    $env.PATH
    | split row (char esep)
    | append [
      $cargo_bin
    ]
    | uniq
  )
}

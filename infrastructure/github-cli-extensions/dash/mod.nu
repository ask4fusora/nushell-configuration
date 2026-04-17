def build-gh-dash-env [] {
  if $env.OS == "Windows_NT" { {
    GH_DASH_CONFIG: ($env.APPDATA | path join "nushell/scripts/modules/github-cli-extensions/dash/config.yml")
  } } else { {} }
}
export def --wrapped "gh dash" [...args] {
  let gh_dash_env = build-gh-dash-env
  with-env $gh_dash_env {
    ^gh dash ...$args
  }
}

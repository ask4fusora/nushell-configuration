export def build-gh-dash-env [] {
  {
    GH_DASH_CONFIG: ($nu.default-config-dir | path join "scripts/modules/github-cli-extensions/dash/config.yml")
  }
}

export def --env install-gh-dash-env [] {
  load-env (build-gh-dash-env)
}

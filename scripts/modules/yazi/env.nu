export def build-yazi-env [] {
  {
    YAZI_CONFIG_HOME: ($nu.default-config-dir | path join "scripts" "modules" "yazi")
  }
}

export def --env install-yazi-env [] {
  load-env (build-yazi-env)
}

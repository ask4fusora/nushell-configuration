export def build-aichat-env [] {
  {AICHAT_SHELL: "Nushell"}
}

export def --env install-aichat-env [] {
  load-env (build-aichat-env)
}

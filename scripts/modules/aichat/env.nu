export def build-aichat-env [] {
  {AICHAT_SHELL: "nu"}
}

export def --env install-aichat-env [] {
  load-env (build-aichat-env)
}

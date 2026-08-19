export-env {
  require-executable nvim

  if $env.EDITOR? == null { $env.EDITOR = "nvim" }
}

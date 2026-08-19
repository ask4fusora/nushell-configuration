use env.nu *
use keybindings.nu *

export def --env "aichat build-env" [] {
  require-executable aichat

  install-aichat-env

  install-aichat-keybindings
}

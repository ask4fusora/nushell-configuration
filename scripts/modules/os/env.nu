use windows/build-env.nu *
use linux/build-env.nu *

export def --env install-os-env [] {
  if $env.OS? == null {
    $env.OS = "Linux"
  }

  match $env.OS {
    "Windows_NT" => { windows build-env }
    "Darwin" => { }
    _ => { linux build-env }
  }

  if $env.HOME? == null {
    $env.HOME = '~' | path expand
  }
}

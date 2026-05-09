use windows *
use linux *
use macos *
use build-env.nu *

export-env {
  os build-env
}

export def --wrapped cb [...rest] {
  match $env.OS {
    "Windows_NT" => { windows-cb ...$rest }
    "Darwin" => { macos-cb ...$rest }
    _ => { linux-cb ...$rest }
  }
}

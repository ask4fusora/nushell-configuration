use windows *
use linux *
use macos *

export def --wrapped cb [...rest] {
  match $env.OS {
    "Windows_NT" => { windows-cb ...$rest }
    "Darwin" => { macos-cb ...$rest }
    _ => { linux-cb ...$rest }
  }
}

export def --wrapped sudo [...rest] {
  match $env.OS {
    "Windows_NT" => { windows-sudo ...$rest }
    "Darwin" => { macos-sudo ...$rest }
    _ => { linux-sudo ...$rest }
  }
}

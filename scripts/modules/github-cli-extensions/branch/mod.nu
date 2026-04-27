# List git branches. Default to local branches.
export def "gh branches" [
  --remote(-r) # List remote branches.
]: nothing -> list<string> {
  if $remote {
    let remote_branches = git branch -r
    | lines
    | find --invert 'origin/HEAD ->'
    | parse --regex '\borigin/(?<branch>.+)'
    | get branch
    | str trim

    return $remote_branches
  }

  git branch
  | lines
  | find --invert 'HEAD detached at'
  | parse --regex '\s(?<branch>.+)'
  | get branch
  | str trim
}

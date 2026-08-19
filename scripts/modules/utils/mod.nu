export def require-executable [
  executable: string # Name or path of the required executable.
  --spanned (-s) # Include the source-code excerpt.
]: nothing -> nothing {
  if (
    which --all $executable
    | where type == external
    | is-empty
  ) {
    error make --unspanned=(not $spanned) {
      msg: $"Required executable `($executable)` was not found."
      labels: [
        {
          text: "Does not resolve to an external executable."
          span: (metadata $executable).span
        }
      ]
      help: $"Install `($executable)` or add its directory to `PATH`."
    }
  }
}

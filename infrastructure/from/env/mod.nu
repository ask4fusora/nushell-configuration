# Parses a raw string stream of environment variables into a typed Nushell record.
# 
export def "from env" []: string -> record {
  # Validates pipeline injection to prevent null reference errors on empty streams.
  if ($in | is-empty) {
      error make { msg: "Pipeline input is empty. Expected a string stream." }
  }

  $in
  | lines
  | str trim
  # Eliminates execution noise by discarding blank lines and full-line comments.
  | where {|line| ($line | is-not-empty) and not ($line | str starts-with "#") }
  # Enforces strict POSIX key conventions; silently drops malformed lines lacking the assignment operator.
  | parse -r '^(?P<key>[a-zA-Z_][a-zA-Z0-9_]*)=(?P<value>.*)$'
  | update value {|row|
      $row.value
      | str trim
      # Normalizes values by stripping symmetrical bounding quotes using raw string literals to prevent escape sequence conflicts.
      | str replace -r r#'^['"](.*)['"]$'# '$1'
  }
  # Mutates the table structure into a flat key-value record compatible with load-env.
  | transpose -r -d
}
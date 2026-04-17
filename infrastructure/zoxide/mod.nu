def build-zoxide-config [] {
  let config = (
    $env.config? | default {} | upsert hooks { default {} } | upsert hooks.env_change { default {} } | upsert hooks.env_change.PWD { default [] }
  )
  let zoxide_hooked = $config.hooks.env_change.PWD | any { try { get __zoxide_hook } catch { false } }
  if $zoxide_hooked { $config } else {
    $config | upsert hooks.env_change.PWD ($config.hooks.env_change.PWD | append {
        __zoxide_hook: true,
        code: {|_, dir| ^zoxide add -- $dir}
      })
  }
}

def --env install-zoxide-hook [] { $env.config = (build-zoxide-config) }

export def --env --wrapped z [...rest: string] {
  install-zoxide-hook

  let path = match $rest {
    [] => { "~" }
    ["-"] => { "-" }
    [$arg] => {
      if (try {
        $arg | path expand | path type
      } catch { null }) == "dir" { $arg } else {
        ^zoxide query --exclude $env.PWD -- $arg | str trim -r -c "\n"
      }
    }
    _ => {
      ^zoxide query --exclude $env.PWD -- ...$rest | str trim -r -c "\n"
    }
  }

  cd $path
}

export def --env --wrapped zi [...rest: string] {
  install-zoxide-hook
  cd $'(^zoxide query --interactive -- ...$rest | str trim -r -c "\n")'
}

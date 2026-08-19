def build-zoxide-hooks [] {
  [
    {
      __zoxide_hook: true
      code: {|_, dir| ^zoxide add -- $dir }
    }
  ]
}

def with-zoxide-hooks [] {
  let config = (
    $env.config?
    | default {}
    | upsert hooks { default {} }
    | upsert hooks.env_change { default {} }
    | upsert hooks.env_change.PWD { default [] }
  )

  let installed = ($config.hooks.env_change.PWD | any {|hook|
    ($hook.__zoxide_hook? | default false)
  })

  if $installed {
    $config
  } else {
    $config | upsert hooks.env_change.PWD ($config.hooks.env_change.PWD ++ (build-zoxide-hooks))
  }
}

export def --env install-zoxide-hooks [] {
  $env.config = (with-zoxide-hooks)
}

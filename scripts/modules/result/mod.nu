use nu-scripts\modules\result

export-env {
  $env.NU_RESULTS = {
    enable: true
    max_items: 10
    results: []
  }
  $env.config.hooks.display_output = { result hook }
}

export use result

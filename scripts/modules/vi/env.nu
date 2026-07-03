export def --env install-vi-env [] {
  $env.config.edit_mode = "vi"

  $env.config.cursor_shape = {vi_insert: line, vi_normal: block}
}

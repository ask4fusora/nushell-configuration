use env.nu *

export def --wrapped ya [...args] {
  let yazi_env = build-yazi-env
  with-env $yazi_env {
    ^yazi ...$args
  }
}
export def --env --wrapped y [...args] {
  let yazi_env = build-yazi-env
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  with-env $yazi_env {
    ^yazi ...$args --cwd-file $tmp
  }
  let cwd = (open $tmp)
  if $cwd != $env.PWD and ($cwd | path exists) { cd $cwd }
  rm -fp $tmp
}

use build-env.nu *

export-env {
  yazi build-env
}

export def --wrapped ya [...args] {
  ^yazi ...$args
}

export def --env --wrapped y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  ^yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != $env.PWD and ($cwd | path exists) { cd $cwd }
  rm -fp $tmp
}

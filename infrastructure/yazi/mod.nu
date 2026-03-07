def --env setup-env [] {
  if $env.OS == "Windows_NT" {
    $env.YAZI_FILE_ONE = $env.USERPROFILE | path join "scoop/apps/git/current/usr/bin/file.exe"
    $env.YAZI_CONFIG_HOME = $env.APPDATA | path join "nushell/infrastructure/yazi"
  }
}
export def --env y [...args] {
  export-env { setup-env  }
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  ^yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != $env.PWD and ($cwd | path exists) { cd $cwd }
  rm -fp $tmp
}

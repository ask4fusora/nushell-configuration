export def build-yazi-env [] {
  if $env.OS == "Windows_NT" {
    {
      YAZI_FILE_ONE: ($env.USERPROFILE | path join "scoop/apps/git/current/usr/bin/file.exe")
      YAZI_CONFIG_HOME: ($env.APPDATA | path join "nushell/scripts/modules/yazi")
    }
  } else { {} }
}

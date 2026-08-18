use modules/env *
use modules/aichat
use modules/zoxide *
use modules/yazi *
use modules/gh-cli *
use modules/from *
use modules/os *
use modules/vi
use modules/admin *
use modules/uv-python *
use modules/zed *
use modules/starship *
use modules/fzf *
use nu-scripts/custom-completions/scoop/scoop-completions.nu *
use nu-scripts/custom-completions/winget/winget-completions.nu *
use nu-scripts/custom-completions/uv/uv-completions.nu *
use nu-scripts/custom-completions/typst/typst-completions.nu *
use nu-scripts/custom-completions/podman/podman-completions.nu *
use nu-scripts/custom-completions/ssh/ssh-completions.nu *
use nu-scripts/custom-completions/rg/rg-completions.nu *
use nu-scripts/custom-completions/op/op-completions.nu *
use nu-scripts/custom-completions/bat/bat-completions.nu *

$env.config.show_banner = false

$env.config.shell_integration.osc133 = false # Until windows fixes its stupid ConPty.

$env.config.completions.algorithm = "Fuzzy"

$env.config.history.file_format = "Sqlite"

$env.config.filesize.unit = "binary"

$env.config.max_last_result_size = 500MiB

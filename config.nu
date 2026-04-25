$env.config.show_banner = false
$env.config.shell_integration.osc133 = false
$env.config.completions.algorithm = "Fuzzy"
$env.config.history.file_format = "Sqlite"

use modules/env-configuration *
use modules/aichat
use modules/zoxide *
use modules/yazi *
use modules/github-cli-extensions *
use modules/from *
use modules/os *
use modules/vi
use modules/result *
use nu-scripts/custom-completions/scoop/scoop-completions.nu *

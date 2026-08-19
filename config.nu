$env.config.show_banner = false

$env.config.shell_integration.osc133 = false # Until windows fixes its stupid ConPty.

$env.config.completions.algorithm = "Fuzzy"

$env.config.history.file_format = "Sqlite"

$env.config.max_last_result_size = 500MB

use modules/utils *
use modules/from *
use modules/vi *

require-executable nvim

use modules/env *

require-executable aichat

use modules/aichat *

require-executable zoxide

use modules/zoxide *

require-executable yazi

use modules/yazi *

require-executable gh

use modules/gh-cli *

require-executable win32yank

use modules/os *

require-executable sudo

use modules/admin *

require-executable uv

use modules/uv-python *
use nu-scripts/custom-completions/uv/uv-completions.nu *

require-executable zed

use modules/zed *

require-executable starship

use modules/starship *

require-executable fzf

use modules/fzf *

require-executable scoop

use nu-scripts/custom-completions/scoop/scoop-completions.nu *

require-executable winget

use nu-scripts/custom-completions/winget/winget-completions.nu *

require-executable typst

use nu-scripts/custom-completions/typst/typst-completions.nu *

require-executable podman

use nu-scripts/custom-completions/podman/podman-completions.nu *

require-executable ssh

use nu-scripts/custom-completions/ssh/ssh-completions.nu *

require-executable rg

use nu-scripts/custom-completions/rg/rg-completions.nu *

require-executable op

use nu-scripts/custom-completions/op/op-completions.nu *

require-executable bat

use nu-scripts/custom-completions/bat/bat-completions.nu *

use scripts\nu-scripts\modules\result
use infrastructure *
use os *
$env.config.hooks.display_output = { result hook }
$env.config.show_banner = false
$env.config.shell_integration.osc133 = false
$env.config.completions.algorithm = "Fuzzy"
$env.config.history.file_format = "Sqlite"

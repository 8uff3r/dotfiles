# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_moon_global_optspecs
	string join \n cache= color c/concurrency= dump log= logFile= q/quiet theme= h/help V/version
end

function __fish_moon_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_moon_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_moon_using_subcommand
	set -l cmd (__fish_moon_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c moon -n "__fish_moon_needs_command" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_needs_command" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_needs_command" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_needs_command" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_needs_command" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_needs_command" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_needs_command" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_needs_command" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_needs_command" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_needs_command" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_needs_command" -f -a "completions" -d 'Generate command completions for your current shell.'
complete -c moon -n "__fish_moon_needs_command" -f -a "init" -d 'Initialize a new moon repository, or a new toolchain, by scaffolding config files.'
complete -c moon -n "__fish_moon_needs_command" -f -a "debug" -d 'Debug internals.'
complete -c moon -n "__fish_moon_needs_command" -f -a "bin" -d 'Return an absolute path to a tool\'s binary within the toolchain.'
complete -c moon -n "__fish_moon_needs_command" -f -a "node" -d 'Special Node.js commands.'
complete -c moon -n "__fish_moon_needs_command" -f -a "setup" -d 'Setup the environment by installing all tools.'
complete -c moon -n "__fish_moon_needs_command" -f -a "teardown" -d 'Teardown the environment by uninstalling all tools and deleting temp files.'
complete -c moon -n "__fish_moon_needs_command" -f -a "action-graph" -d 'Display an interactive dependency graph of all tasks and actions.'
complete -c moon -n "__fish_moon_needs_command" -f -a "project" -d 'Display information about a single project.'
complete -c moon -n "__fish_moon_needs_command" -f -a "project-graph" -d 'Display an interactive graph of projects.'
complete -c moon -n "__fish_moon_needs_command" -f -a "task-graph" -d 'Display an interactive graph of tasks.'
complete -c moon -n "__fish_moon_needs_command" -f -a "sync" -d 'Sync the workspace to a healthy state.'
complete -c moon -n "__fish_moon_needs_command" -f -a "task" -d 'Display information about a single task.'
complete -c moon -n "__fish_moon_needs_command" -f -a "generate" -d 'Generate and scaffold files from a pre-defined template.'
complete -c moon -n "__fish_moon_needs_command" -f -a "templates" -d 'List all templates that are available for code generation.'
complete -c moon -n "__fish_moon_needs_command" -f -a "check" -d 'Run all build and test related tasks for the current project.'
complete -c moon -n "__fish_moon_needs_command" -f -a "ci" -d 'Run all affected projects and tasks in a CI environment.'
complete -c moon -n "__fish_moon_needs_command" -f -a "run" -d 'Run one or many project tasks and their dependent tasks.'
complete -c moon -n "__fish_moon_needs_command" -f -a "ext" -d 'Execute an extension plugin.'
complete -c moon -n "__fish_moon_needs_command" -f -a "toolchain" -d 'Manage toolchain plugins.'
complete -c moon -n "__fish_moon_needs_command" -f -a "clean" -d 'Clean the workspace and delete any stale or invalid artifacts.'
complete -c moon -n "__fish_moon_needs_command" -f -a "docker" -d 'Operations for integrating with Docker and Dockerfile(s).'
complete -c moon -n "__fish_moon_needs_command" -f -a "mcp" -d 'Start an MCP (model context protocol) server that can respond to AI agent requests.'
complete -c moon -n "__fish_moon_needs_command" -f -a "migrate" -d 'Operations for migrating existing projects to moon.'
complete -c moon -n "__fish_moon_needs_command" -f -a "query" -d 'Query information about moon, the environment, and pipeline.'
complete -c moon -n "__fish_moon_needs_command" -f -a "upgrade" -d 'Upgrade to the latest version of moon.'
complete -c moon -n "__fish_moon_using_subcommand completions" -l shell -d 'Shell to generate for' -r
complete -c moon -n "__fish_moon_using_subcommand completions" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand completions" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand completions" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand completions" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand completions" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand completions" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand completions" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand completions" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand completions" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand completions" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand init" -l to -d 'Destination to initialize into' -r
complete -c moon -n "__fish_moon_using_subcommand init" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand init" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand init" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand init" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand init" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand init" -l force -d 'Overwrite existing configurations'
complete -c moon -n "__fish_moon_using_subcommand init" -l minimal -d 'Initialize with minimal configuration and prompts'
complete -c moon -n "__fish_moon_using_subcommand init" -l yes -d 'Skip prompts and use default values'
complete -c moon -n "__fish_moon_using_subcommand init" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand init" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand init" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand init" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand init" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -f -a "config" -d 'Debug loaded configuration.'
complete -c moon -n "__fish_moon_using_subcommand debug; and not __fish_seen_subcommand_from config vcs" -f -a "vcs" -d 'Debug the VCS.'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from config" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand debug; and __fish_seen_subcommand_from vcs" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand bin" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand bin" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand bin" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand bin" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand bin" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand bin" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand bin" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand bin" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand bin" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c moon -n "__fish_moon_using_subcommand bin" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand node; and not __fish_seen_subcommand_from run-script" -f -a "run-script" -d 'Run a `package.json` script within a project.'
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l project -d 'ID of project to run in' -r
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand node; and __fish_seen_subcommand_from run-script" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand setup" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand setup" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand setup" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand setup" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand setup" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand setup" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand setup" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand setup" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand setup" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand setup" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand teardown" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand teardown" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand teardown" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand teardown" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand teardown" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand teardown" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand teardown" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand teardown" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand teardown" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand teardown" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l host -d 'The host address' -r
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l port -d 'The port to bind to' -r
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand action-graph" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l dependents -d 'Include dependents of the focused target(s)'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l dot -d 'Print the graph in DOT format'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l json -d 'Print the graph in JSON format'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand action-graph" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand project" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand project" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand project" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand project" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand project" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand project" -l json -d 'Print in JSON format'
complete -c moon -n "__fish_moon_using_subcommand project" -l no-tasks -d 'Do not include tasks in output'
complete -c moon -n "__fish_moon_using_subcommand project" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand project" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand project" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand project" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand project" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l host -d 'The host address' -r
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l port -d 'The port to bind to' -r
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand project-graph" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l dependents -d 'Include direct dependents of the focused project'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l dot -d 'Print the graph in DOT format'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l json -d 'Print the graph in JSON format'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand project-graph" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l host -d 'The host address' -r
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l port -d 'The port to bind to' -r
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand task-graph" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l dependents -d 'Include direct dependents of the focused target'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l dot -d 'Print the graph in DOT format'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l json -d 'Print the graph in JSON format'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand task-graph" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -f -a "codeowners" -d 'Aggregate and sync code owners to a `CODEOWNERS` file.'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -f -a "config-schemas" -d 'Generate and sync configuration JSON schemas for use within editors.'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -f -a "hooks" -d 'Generate and sync hook scripts for the workspace configured VCS.'
complete -c moon -n "__fish_moon_using_subcommand sync; and not __fish_seen_subcommand_from codeowners config-schemas hooks projects" -f -a "projects" -d 'Sync all projects and configs in the workspace.'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l clean -d 'Clean and remove previously generated file'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l force -d 'Bypass cache and force create file'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from codeowners" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l force -d 'Bypass cache and force create schemas'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from config-schemas" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l clean -d 'Clean and remove previously generated hooks'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l force -d 'Bypass cache and force create hooks'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from hooks" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand sync; and __fish_seen_subcommand_from projects" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand task" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand task" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand task" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand task" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand task" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand task" -l json -d 'Print in JSON format'
complete -c moon -n "__fish_moon_using_subcommand task" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand task" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand task" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand task" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand task" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand generate" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand generate" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand generate" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand generate" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand generate" -l defaults -d 'Use the default value of all variables instead of prompting'
complete -c moon -n "__fish_moon_using_subcommand generate" -l dryRun -d 'Run entire generator process without writing files'
complete -c moon -n "__fish_moon_using_subcommand generate" -l force -d 'Force overwrite any existing files at the destination'
complete -c moon -n "__fish_moon_using_subcommand generate" -l template -d 'Create a new template'
complete -c moon -n "__fish_moon_using_subcommand generate" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand generate" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand generate" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand generate" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand generate" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand templates" -l filter -d 'Filter the templates based on this pattern' -r
complete -c moon -n "__fish_moon_using_subcommand templates" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand templates" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand templates" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand templates" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand templates" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand templates" -l json -d 'Print in JSON format'
complete -c moon -n "__fish_moon_using_subcommand templates" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand templates" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand templates" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand templates" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand templates" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand check" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand check" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand check" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand check" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand check" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand check" -l all -d 'Run check for all projects in the workspace'
complete -c moon -n "__fish_moon_using_subcommand check" -s s -l summary -d 'Include a summary of all actions that were processed in the pipeline'
complete -c moon -n "__fish_moon_using_subcommand check" -s u -l updateCache -d 'Bypass cache and force update any existing items'
complete -c moon -n "__fish_moon_using_subcommand check" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand check" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand check" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand check" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand check" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand ci" -l base -d 'Base branch, commit, or revision to compare against' -r
complete -c moon -n "__fish_moon_using_subcommand ci" -l head -d 'Current branch, commit, or revision to compare with' -r
complete -c moon -n "__fish_moon_using_subcommand ci" -l job -d 'Index of the current job' -r
complete -c moon -n "__fish_moon_using_subcommand ci" -l jobTotal -d 'Total amount of jobs to run' -r
complete -c moon -n "__fish_moon_using_subcommand ci" -l downstream -d 'Control the depth of downstream dependents' -r -f -a "none\t''
direct\t''
deep\t''"
complete -c moon -n "__fish_moon_using_subcommand ci" -l upstream -d 'Control the depth of upstream dependencies' -r -f -a "none\t''
direct\t''
deep\t''"
complete -c moon -n "__fish_moon_using_subcommand ci" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand ci" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand ci" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand ci" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand ci" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand ci" -l stdin -d 'Accept touched files from stdin for affected checks'
complete -c moon -n "__fish_moon_using_subcommand ci" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand ci" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand ci" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand ci" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand ci" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand run" -l query -d 'Focus target(s) based on the result of a query' -r
complete -c moon -n "__fish_moon_using_subcommand run" -l profile -d 'Record and generate a profile for ran tasks' -r -f -a "cpu\t''
heap\t''"
complete -c moon -n "__fish_moon_using_subcommand run" -l status -d 'Filter affected files based on a touched status' -r
complete -c moon -n "__fish_moon_using_subcommand run" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand run" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand run" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand run" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand run" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand run" -l dependents -d 'Run dependents of the primary targets'
complete -c moon -n "__fish_moon_using_subcommand run" -s f -l force -d 'Force run and ignore touched files and affected status'
complete -c moon -n "__fish_moon_using_subcommand run" -s i -l interactive -d 'Run the target interactively'
complete -c moon -n "__fish_moon_using_subcommand run" -s s -l summary -d 'Include a summary of all actions that were processed in the pipeline'
complete -c moon -n "__fish_moon_using_subcommand run" -s u -l updateCache -d 'Bypass cache and force update any existing items'
complete -c moon -n "__fish_moon_using_subcommand run" -l no-actions -d 'Run the task without including sync and setup related actions in the graph'
complete -c moon -n "__fish_moon_using_subcommand run" -s n -l no-bail -d 'When a task fails, continue executing other tasks instead of aborting immediately'
complete -c moon -n "__fish_moon_using_subcommand run" -l affected -d 'Only run target if affected by touched files or the environment'
complete -c moon -n "__fish_moon_using_subcommand run" -l remote -d 'Determine affected against remote by comparing against a base revision'
complete -c moon -n "__fish_moon_using_subcommand run" -l stdin -d 'Accept touched files from stdin for affected checks'
complete -c moon -n "__fish_moon_using_subcommand run" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand run" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand run" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand run" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand run" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand ext" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand ext" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand ext" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand ext" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand ext" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand ext" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand ext" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand ext" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand ext" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand ext" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -f -a "add" -d 'Add and configure a toolchain plugin in .moon/toolchain.yml.'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and not __fish_seen_subcommand_from add info" -f -a "info" -d 'Show detailed information about a toolchain plugin.'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l minimal -d 'Initialize with minimal configuration and prompts'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l yes -d 'Skip prompts and use default values'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from add" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand toolchain; and __fish_seen_subcommand_from info" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand clean" -l lifetime -d 'Lifetime of cached artifacts' -r
complete -c moon -n "__fish_moon_using_subcommand clean" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand clean" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand clean" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand clean" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand clean" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand clean" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand clean" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand clean" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand clean" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand clean" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -f -a "file" -d 'Generate a default Dockerfile for a project.'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -f -a "prune" -d 'Remove extraneous files and folders within a Dockerfile.'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -f -a "scaffold" -d 'Scaffold a repository skeleton for use within Dockerfile(s).'
complete -c moon -n "__fish_moon_using_subcommand docker; and not __fish_seen_subcommand_from file prune scaffold setup" -f -a "setup" -d 'Setup a Dockerfile by installing dependencies for necessary projects.'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l buildTask -d 'ID of a task to build the project' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l image -d 'Base Docker image to use' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l startTask -d 'ID of a task to run the project' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l defaults -d 'Use default options instead of prompting'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l no-prune -d 'Do not prune the workspace in the build stage'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l no-toolchain -d 'Do not use the toolchain and instead use system binaries'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from file" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from prune" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from scaffold" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand docker; and __fish_seen_subcommand_from setup" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand mcp" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand mcp" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand mcp" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand mcp" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand mcp" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand mcp" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand mcp" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand mcp" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand mcp" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand mcp" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l skipTouchedFilesCheck -d 'Disable the check for touched/dirty files'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -f -a "from-package-json" -d 'Migrate `package.json` scripts and dependencies to `moon.*`.'
complete -c moon -n "__fish_moon_using_subcommand migrate; and not __fish_seen_subcommand_from from-package-json from-turborepo" -f -a "from-turborepo" -d 'Migrate `turbo.json` to moon configuration files.'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l skipTouchedFilesCheck -d 'Skip checking for touched files to determine if the repo is dirty'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-package-json" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l skipTouchedFilesCheck -d 'Disable the check for touched/dirty files'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand migrate; and __fish_seen_subcommand_from from-turborepo" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -f -a "hash" -d 'Inspect the contents of a generated hash.'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -f -a "hash-diff" -d 'Query the difference between two hashes.'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -f -a "projects" -d 'Query for projects within the project graph.'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -f -a "tasks" -d 'List all available tasks, grouped by project.'
complete -c moon -n "__fish_moon_using_subcommand query; and not __fish_seen_subcommand_from hash hash-diff projects tasks touched-files" -f -a "touched-files" -d 'Query for touched files between revisions.'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l json -d 'Print the manifest in JSON format'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l json -d 'Print the diff in JSON format'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from hash-diff" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l alias -d 'Filter projects that match this alias' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l downstream -d 'Include downstream dependents of queried projects' -r -f -a "none\t''
direct\t''
deep\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l id -d 'Filter projects that match this ID' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l language -d 'Filter projects of this programming language' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l layer -d 'Filter projects of this layer' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l stack -d 'Filter projects that match this source path' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l source -d 'Filter projects of this tech stack' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l tags -d 'Filter projects that have the following tags' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l tasks -d 'Filter projects that have the following tasks' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l upstream -d 'Include upstream dependencies of queried projects' -r -f -a "none\t''
direct\t''
deep\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l affected -d 'Filter projects that are affected based on touched files'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l dependents -d 'Include direct dependents of queried projects'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l json -d 'Print the projects in JSON format'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from projects" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l downstream -d 'Include downstream dependents of queried tasks' -r -f -a "none\t''
direct\t''
deep\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l upstream -d 'Include upstream dependencies of queried tasks' -r -f -a "none\t''
direct\t''
deep\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l id -d 'Filter tasks that match this ID' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l command -d 'Filter tasks with the provided command' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l platform -d 'Filter tasks that belong to a platform' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l project -d 'Filter tasks that belong to a project' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l script -d 'Filter tasks with the provided script' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l toolchain -d 'Filter tasks that belong to a toolchain' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l type -d 'Filter projects of this type' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l affected -d 'Filter tasks that are affected based on touched files'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l json -d 'Print the tasks in JSON format'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from tasks" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l base -d 'Base branch, commit, or revision to compare against' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l head -d 'Current branch, commit, or revision to compare with' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l status -d 'Filter files based on a touched status' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l defaultBranch -d 'When on the default branch, compare against the previous revision'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l json -d 'Print the files in JSON format'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l local -d 'Gather files from your local state instead of the remote'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l remote -d 'Gather files from the remote state instead of your local'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand query; and __fish_seen_subcommand_from touched-files" -s V -l version -d 'Print version'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l cache -d 'Mode for cache operations' -r
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s c -l concurrency -d 'Maximum number of threads to utilize' -r
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l log -d 'Lowest log level to output' -r -f -a "off\t''
error\t''
warn\t''
info\t''
debug\t''
trace\t''
verbose\t''"
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l logFile -d 'Path to a file to write logs to' -r -F
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l theme -d 'Terminal theme to print with' -r -f -a "dark\t''
light\t''"
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l color -d 'Force colored output'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l dump -d 'Dump a trace profile to the working directory'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s q -l quiet -d 'Hide all non-important terminal output'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s V -l version -d 'Print version'

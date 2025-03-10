export-env {
    # constants
    let ALIAS_PREFIX = " Alias Tip:"
    # functions
    export def check_if_aliased [cmd: string] {
        if (help aliases | where name == '($cmd)' | length ) > 0 {
            return
        }
        if (help aliases | where expansion == ($cmd) | length ) > 0 {
            print $"(ansi blue_bold)($ALIAS_PREFIX)(ansi reset) (help aliases | where expansion == ($cmd) | get 0 | get name)"
            return
        }
        if (help aliases | where {|it| $it.expansion | str contains '($cmd)'} | length ) > 0 {
            print $"(ansi blue_bold)($ALIAS_PREFIX)(ansi reset) (help aliases | where {|it| $it.expansion | str contains '($cmd)'} | get 0 | get name)"
            return
        }
    }
    # hook
    $env.config = (
        $env.config
        | upsert hooks.pre_execution [ {|| 
            $env.repl_commandline = (commandline) 
            check_if_aliased $env.repl_commandline
        } ]
    )
}

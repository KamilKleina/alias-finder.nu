export-env {
    def get_prefix [] {
        if ($env.NU_ALIAS_FINDER_PREFIX? | is-empty) == true {
            return " Alias Tip:"
        }
        return $env.NU_ALIAS_FINDER_PREFIX
    }
    def check_if_command_in_ignored [cmd: string] {
        if ($env.NU_ALIAS_FINDER_IGNORED? | is-empty) == true {
            return false
        }
        let $ignored = ($env.NU_ALIAS_FINDER_IGNORED | split row ",")
        return ($ignored | any { |item| $item | str contains $cmd })
        if ($ignored | any { |item| $item | str contains $cmd }) {
            return true
        }
        return false
    }
    # functions
    export def check_if_aliased [cmd: string] {
        if (check_if_command_in_ignored $cmd) == true {
            return
        }
        if (help aliases | where name == '($cmd)' | length ) > 0 {
            return
        }
        if (help aliases | where expansion == ($cmd) | length ) > 0 {
            print $"(ansi blue_bold)(get_prefix)(ansi reset) (help aliases | where expansion == ($cmd) | get 0 | get name)"
            return
        }
        if (help aliases | where {|it| $it.expansion | str contains '($cmd)'} | length ) > 0 {
            print $"(ansi blue_bold)(get_prefix)(ansi reset) (help aliases | where {|it| $it.expansion | str contains '($cmd)'} | get 0 | get name)"
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

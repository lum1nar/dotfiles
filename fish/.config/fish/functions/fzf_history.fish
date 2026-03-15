function fzf_history
    set command (history | fzf)
    # echo "$command"
    if test -z "$command"
        return
    end
    commandline --replace "$command"
end

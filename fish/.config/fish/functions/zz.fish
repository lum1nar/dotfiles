function zz
    set dir (zoxide query -l | fzf)
    if test -z "$dir"
        return
    end

    cd "$dir"
end

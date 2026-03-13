function note
    set note (find ~/obsidian/4\ -\ 筆記/ | fzf)

    if test -z "$note"
        return
    end

    vim "$note"
end

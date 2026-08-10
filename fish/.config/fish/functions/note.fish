function note
    set dir ~/obsidian/4\ -\ 筆記/

    set result (rg --line-number --no-heading --color=never . "$dir" |
        fzf \
            --delimiter ':' \
            --preview 'bat --color=always --style=numbers --highlight-line {2} {1}' \
            --preview-window 'right:60%')

    if test -z "$result"
        return
    end

    echo "$result"

    set file (string split ':' "$result")[1]
    set line (string split ':' "$result")[2]

    nvim "+$line" "$file"
end

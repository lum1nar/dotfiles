function vf
    set file (fzf)
    # if we termintate fzf, we won't open empty file with vim
    if test -n "$file"
        vim "$file"
    end
end


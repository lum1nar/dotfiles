# Environment variables
set -x EDITOR nvim

# Alias
alias vim='nvim'
alias ll="ls -lah"
# alias ls="ls -a"
alias gl='git log --graph --oneline --all'
alias ga='git add --all'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'

# vi-mode
fish_vi_key_bindings
function fish_vi_cursor
    echo -ne "\e[2 q"
end

# Read .env file
# echo (cat ~/.env)
for line in (cat ~/.env)
    # echo set -lx (string split '=' $line)
    # echo line
    set -x (string split '=' $line)
end


# if test -f ~/.config/fish/fzf-git.fish
#     source ~/.config/fish/fzf-git.fish
# end

# use uv installed tools
fish_add_path $HOME/.local/bin


# starfish
starship init fish | source

# zoxide
zoxide init fish | source

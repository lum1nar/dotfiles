# Environment variables
set -x EDITOR nvim

# Alias
alias vim='nvim'
alias gl='git log --graph --oneline --all'
alias ga='git add --all'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias note='vim "$(find ~/obsidian/4\ -\ 筆記 | fzf)"'

# vi-mode
fish_vi_key_bindings

# zoxide
zoxide init fish | source

# Read .env file
# echo (cat ~/.env)
for line in (cat ~/.env)
    # echo set -lx (string split '=' $line)
    # echo line
    set -x (string split '=' $line)
end

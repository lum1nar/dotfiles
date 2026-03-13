# Environment variables
set -x EDITOR nvim

# Open Tmux By Default
if status is-interactive
    and not set -q TMUX
    exec tmux
end

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

# zoxide
zoxide init fish | source

# Read .env file
# echo (cat ~/.env)
for line in (cat ~/.env)
    # echo set -lx (string split '=' $line)
    # echo line
    set -x (string split '=' $line)
end

set SPACEFISH_PROMPT_ORDER user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char
set SPACEFISH_RPROMPT_ORDER time
set SPACEFISH_TIME_SHOW true
set SPACEFISH_TIME_PREFIX
set SPACEFISH_DIR_TRUNC 0

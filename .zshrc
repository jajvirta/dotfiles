# Keymap
bindkey -e
autoload -U select-word-style
select-word-style bash

# Path
export PATH=$HOME/.local/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Kubernetes
export K9S_CONFIG_DIR=~/.config/k9s
export KUBE_EDITOR=nvim
alias k=kubectl

alias cheatsheet='google-chrome --app=file:///home/jajvirta/linux_installation/wezterm-cheatsheet.html --window-size=340,520'


# Editor
alias vim=nvim
export EDITOR=nvim

# Project shortcuts
alias cpi="cd ~/projects/yle-aws-infra/"

# Ripgrep
#export RIPGREP_CONFIG_PATH=~/.ripgreprc

# Navigate to a directory using fd + fzf
cd_to_dir() {
    local selected_dir
    selected_dir=$(fd -t d . "$1" | fzf +m --height 50% --preview 'tree -C {}')
    if [[ -n "$selected_dir" ]]; then
        cd "$selected_dir" || return 1
    fi
}
cd_to_projects() { cd_to_dir ~/projects/ }
alias p='cd_to_dir ~/projects/'
alias cds='cd_to_dir'
bindkey -s '^o' "cd_to_projects^M"

# GPG (needed to avoid "Inappropriate ioctl for device" error)
export GPG_TTY=$(tty)

# History
HISTSIZE=100000
SAVEHIST=$HISTSIZE
unsetopt inc_append_history
unsetopt share_history

# Completion
fpath=(~/.local/share/zsh/completions $fpath)
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Atuin (shell history)
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
bindkey '^P' up-history
bindkey '^N' down-history

# Scaleway CLI autocomplete
eval "$(scw autocomplete script shell=zsh)"

# Plugins
source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
eval "$(starship init zsh)"

# Clipboard aliases
alias xc='xclip -selection clipboard'
alias xp='xclip -selection clipboard -o'

autoload -U colors && colors
setopt PROMPT_SUBST
autoload -z edit-command-line
zle -N edit-command-line

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# edit current line in neovim
bindkey -M vicmd v edit-command-line

# aliases
alias v='nvim'
alias ls='ls --color'
alias g='git'
alias lg='lazygit'
alias f='cd $(find . -type d | fzf --border-label=" Change Directory ")'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# vi indicator
## Options
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'%F{blue}[I]%f'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'%F{red}[N]%f'}

## Set symbol for the initial mode
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

## on keymap change, define the mode and redraw prompt
zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
  else
    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

## reset to default mode at the end of line input reading
zle-line-finish() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

## Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

PROMPT='$THEME_VI_MODE_SYMBOL %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$ '

# random variables and stuff
## the best editor
export EDITOR="nvim"
## Add openjdk to the path variable
export PATH="/usr/local/opt/openjdk/bin:$PATH"
## Add local bin to the path variable
export PATH="$HOME/.local/bin:$PATH"
## set GOPATH
export GOPATH="$HOME/coding/go"
## add go bin folder to path
export PATH="$HOME/coding/go/bin:$PATH"
## fzf stuff
export FZF_DEFAULT_OPTS="
  --bind=tab:down,btab:up,ctrl-j:toggle+down,ctrl-n:toggle+up
  --color=border:6,label:6
  --margin=5%
  --border
  --reverse"

# Load zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

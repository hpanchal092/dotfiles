autoload -U colors && colors
setopt PROMPT_SUBST
autoload -z edit-command-line
zle -N edit-command-line

# random variables and stuff
## the best editor
export EDITOR="nvim"
## Add openjdk to the path variable
export PATH="/usr/local/opt/openjdk/bin:$PATH"
## Add local bin to the path variable
export PATH="$HOME/.local/bin:$PATH"
## Add fzf to path
export PATH="$HOME/.fzf/bin:$PATH"
## set GOPATH
export GOPATH="$HOME/coding/go"
## add go bin folder to path
export PATH="$HOME/coding/go/bin:$PATH"
## fzf stuff
export FZF_DEFAULT_OPTS="
  --bind=tab:down,btab:up,ctrl-n:toggle+down,ctrl-p:toggle+up
  --color=border:6,label:6
  --margin=5%
  --border
  --reverse"
export FZF_DEFAULT_COMMAND="fd --type f  --hidden --exclude .git --ignore-file .gitignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Load zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias v='nvim'
alias ls='ls --color'
alias ll='ls -la --color'
alias la='ls -a --color'
alias g='git'
alias gd='nvim +DiffviewOpen'
alias lg='lazygit'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M vicmd 'j' history-search-backward
bindkey -M vicmd 'k' history-search-forward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# edit current line in neovim
bindkey -M vicmd v edit-command-line

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

source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

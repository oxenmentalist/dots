# large, persistent history shared by all zsh sessions
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Search history by the command prefix already typed.
# For example, type "tmux" and press Up to browse only tmux commands.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

for keymap in emacs viins; do
  bindkey -M "$keymap" '^[[A' up-line-or-beginning-search
  bindkey -M "$keymap" '^[OA' up-line-or-beginning-search
  bindkey -M "$keymap" '^[[B' down-line-or-beginning-search
  bindkey -M "$keymap" '^[OB' down-line-or-beginning-search
done
unset keymap

# better cd
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# fzf
if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi

# aliases
if (( $+commands[eza] )); then
  alias ls="eza"
  alias ll="eza -lah"
else
  alias ll="ls -lah"
fi

if (( $+commands[bat] )); then
  alias cat="bat"
fi

# prompt
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

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

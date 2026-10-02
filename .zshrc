# ------------------------------------------------------------
# Powerlevel10k Instant Prompt
# Muss ganz oben stehen. Alles, was eine Eingabe erwartet
# (z. B. Passwortabfragen), muss darüber stehen.
# ------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------
# Homebrew (nur macOS: Apple Silicon oder Intel)
# ------------------------------------------------------------
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ------------------------------------------------------------
# PATH
# ------------------------------------------------------------
export VOLTA_HOME="$HOME/.volta"

# typeset -U: keine doppelten Einträge im PATH
typeset -U path
path=(
  "$HOME/.local/bin"      # uv, kitty, just, eigene Skripte
  "$VOLTA_HOME/bin"       # node, npm (Volta)
  "$HOME/go/bin"          # mit "go install" installierte Tools
  $path
)

# macOS: python3/pip von Homebrew (python@3.14) statt Apple-Python
if [[ -n "${HOMEBREW_PREFIX:-}" && -d "$HOMEBREW_PREFIX/opt/python@3.14/libexec/bin" ]]; then
  path=("$HOMEBREW_PREFIX/opt/python@3.14/libexec/bin" $path)
fi

export PATH

# ------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh-syntax-highlighting muss als letztes Plugin stehen
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------
# Allgemein
# ------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

# Verlauf
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS   # doppelte Befehle nicht speichern
setopt SHARE_HISTORY          # Verlauf zwischen Terminals teilen

# Aliase
alias vim="nvim"
alias ll="ls -lah"   # funktioniert unter Linux und macOS

# ------------------------------------------------------------
# Powerlevel10k-Konfiguration
# Fehlt ~/.p10k.zsh, startet beim ersten Öffnen der
# Einrichtungsassistent (später erneut: p10k configure).
# ------------------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

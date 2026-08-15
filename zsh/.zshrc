# ======================
# Homebrew
# ======================

case "$CURRENT_OS" in
    macos)
        if [[ -d "/opt/homebrew" ]]; then
            export BREW_PATH="/opt/homebrew"
        else
            export BREW_PATH="/usr/local"
        fi
        ;;
    linux)
        export BREW_PATH="/home/linuxbrew/.linuxbrew"
        ;;
    *)
        echo "Warning: Unsupported OS for Homebrew: $CURRENT_OS"
        export BREW_PATH="/usr/local"
        ;;
esac

if [[ -x "$BREW_PATH/bin/brew" ]]; then
    eval "$($BREW_PATH/bin/brew shellenv)"
else
    echo "Warning: Homebrew not found at $BREW_PATH"
fi

# ======================
# Syntax Highlighting & Autosuggestions
# ======================

case "$CURRENT_OS" in
    macos)
        if [[ -f $(brew --prefix)/share/zsh-f-sy-h/F-Sy-H.plugin.zsh ]]; then
          # fast-syntax-highlighting
          source $(brew --prefix)/share/zsh-f-sy-h/F-Sy-H.plugin.zsh
          # zsh-autocomplete
          source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
          # zsh-autosuggestions
          source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
          # other completions
          fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
        fi
        ;;
    linux)
        [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
            source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
            fpath+=( "$XDG_DATA_HOME/zsh/functions" )
        [[ -f /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && \
            source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
        [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
            source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        ;;
esac

# ======================
# Completion
# ======================

autoload -Uz compinit
compinit -C -d "$ZSH_COMPDUMP"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# initialize zoxide
eval "$(zoxide init zsh)"

# ======================
# History
# ======================

HISTFILE="$XDG_CACHE_HOME/zsh/history-${HOST}"
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# ======================
# Shell behavior
# ======================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# ======================
# Python
# ======================

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init -)"
fi

# ======================
# Source config files
# ======================

source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/starship.zsh"

ff

# ======================
# OS Detection
# ======================

# Detect current OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)
            echo "macos"
            ;;
        Linux*)
            echo "linux"
            ;;
        CYGWIN*|MINGW32*|MSYS*|MINGW*)
            echo "windows"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# Set OS variable
export CURRENT_OS=$(detect_os)

# ======================
# Homebrew
# ======================

# Set Brew path based on OS
case "$CURRENT_OS" in
    macos)
        # macOS
        if [[ -d "/opt/homebrew" ]]; then
            export BREW_PATH="/opt/homebrew"  # Apple Silicon
        else
            export BREW_PATH="/usr/local"     # Default fallback
        fi
        ;;
    linux)
        export BREW_PATH="/home/linuxbrew/.linuxbrew"
        ;;
    *)
        echo "Warning: Unsupported OS for Homebrew: $CURRENT_OS"
        export BREW_PATH="/usr/local"  # Fallback
        ;;
esac

# Initialize Homebrew if it exists
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
        # fast-syntax-highlighting
        source $XDG_CONFIG_HOME/f-sy-h/F-Sy-H.plugin.zsh
        # zsh-autocomplete
        source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
        # zsh-autosuggestions
        source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        # other completions
        source $(brew --prefix)/share/zsh/site-functions
        ;;
    linux)
        if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
          # fast-syntax-highlighting
          source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
          # zsh-autocomplete
          source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
          # zsh-autosuggestions
          source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
          # other completions
          # source /usr/share/zsh/site-functions
        fi
        ;;
esac

# ======================
# History
# ======================

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# options
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# ======================
# shell behavior
# ======================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# ======================
# Completion
# ======================

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

autoload -Uz compinit
compinit -C -d $ZSH_COMPDUMP

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# initialize zoxide
eval "$(zoxide init zsh)"

# ======================
# Python
# ======================

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init - bash)"
    eval "$(pyenv virtualenv-init -)"
fi

# ======================
# source config files
# ======================

source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/starship.zsh"

# ======================
# Work related
# ======================

case "$(uname -s)" in
    Darwin*)
        source "${HOME}/git/qol/scripts/wrappers.zsh"
        ;;
    Linux*)
        source "${HOME}/Work/repo/qol/scripts/wrappers.zsh"
        ;;
esac

ff

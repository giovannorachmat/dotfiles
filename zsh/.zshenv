# ======================
# OS Detection
# ======================

detect_os() {
    case "$(uname -s)" in
        Darwin*)                        echo "macos" ;;
        Linux*)                         echo "linux" ;;
        CYGWIN*|MINGW32*|MSYS*|MINGW*)  echo "windows" ;;
        *)                              echo "unknown" ;;
    esac
}

export CURRENT_OS=$(detect_os)

# ======================
# XDG folders
# ======================

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_VIDEOS_HOME="$HOME/Videos"
export XDG_PICTURES_HOME="$HOME/Pictures"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"

# compdump
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${HOST}"
mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle '*:compinit' arguments -C -d "$ZSH_COMPDUMP"

# ======================
# Paths
# ======================

# PATH configuration — Homebrew path removed, it's handled in .zshrc via brew shellenv
# export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:/usr/local/bin:$HOME/.rd/bin:$HOME/.pulumi/bin:/usr/pulumi/bin:$HOME/google-cloud-sdk/bin:$HOME/go/bin:$HOME/.opencode/bin:$PATH"

paths=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "/usr/local/bin"
    "$HOME/.rd/bin"
    "$HOME/.pulumi/bin"
    "/usr/pulumi/bin"
    "$HOME/google-cloud-sdk/bin"
    "$HOME/go/bin"
    "$HOME/.opencode/bin"
    "$PATH"
)

# Join with colons
export PATH=$(IFS=:; echo "${paths[*]}")

# ======================
# Core
# ======================

export TERM=xterm-256color
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
export EDITOR="nvim"
export VISUAL="nvim"


# ======================
# Misc
# ======================

# bat theme
export BAT_THEME="Monokai Extended Bright"

# Starship configuration
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# Docker
export DOCKER_MCP_IN_CONTAINER=1

case "$CURRENT_OS" in
    macos)
        export DOCKER_HOST=unix://$XDG_CONFIG_HOME/colima/docker.sock
        ;;
    linux)
        export DOCKER_HOST=unix:///var/run/docker.sock
        ;;
esac

# gcloud sdk & completion
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

rm -f "$ZDOTDIR/.zcompdump" "$ZDOTDIR/.zcompdump.zwc"

# set up XDG folders
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
export XDG_VIDEOS_HOME="$HOME/Videos"
export XDG_PICTURES_HOME="$HOME/Pictures"

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

# Core
export TERM=xterm-256color
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
export EDITOR="nvim"
export VISUAL="nvim"

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/giovannorachmat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/giovannorachmat/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/giovannorachmat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/giovannorachmat/google-cloud-sdk/completion.zsh.inc'; fi

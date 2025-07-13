# ======================
# Environment Variables
# ======================

# Brew configuration
export BREW_PATH="/home/linuxbrew/.linuxbrew"
eval "$($BREW_PATH/bin/brew shellenv)"

# PATH configuration
export ROFI_SCRIPTS_PATH=".config/rofi/scripts"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/$ROFI_SCRIPTS_PATH:$BREW_PATH/bin:/usr/local/bin:$PATH"

# XDG and general environment
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export TERM=xterm-256color
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# Application settings
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME="Monokai Extended Bright"

# GCP settings
export GCP_ZONE="asia-southeast2-a"

# EDITOR
export EDITOR=nvim
export VISUAL=nvim

# ======================
# Environment Variables
# ======================

# Brew configuration
export BREW_PATH="/home/linuxbrew/.linuxbrew"
eval "$($BREW_PATH/bin/brew shellenv)"

# PATH configuration
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/$BREW_PATH/bin:/usr/local/bin:$PATH"

# XDG and general environment
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export TERM=xterm-256color
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME="Monokai Extended Bright"

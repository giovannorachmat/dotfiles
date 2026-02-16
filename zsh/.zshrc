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

# ======================
# Environment Variables
# ======================

export ZSH_CONFIG_DIR="${HOME}/.config/zsh"

# Set OS variable
export CURRENT_OS=$(detect_os)

# Brew configuration
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

# PATH configuration
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/$BREW_PATH/bin:/usr/local/bin:$HOME/.rd/bin:$HOME/.pulumi/bin:/usr/pulumi/bin:$HOME/.opencode/bin:$PATH"

# set up XDG folders
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# general environment
export TERM=xterm-256color
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME="Monokai Extended Bright"

# ======================
# History
# ======================

# History
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE="$XDG_CACHE_HOME/zsh/.zsh_history"
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"

# Compdump
autoload -Uz compinit; compinit -C -d $ZSH_COMPDUMP

# History options
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ======================
# Aliases
# ======================

# Eza (better ls)
alias ls="eza -a -h --color=always --long --git -T -L 1 --icons=always --no-filesize"

# System info
alias ff="clear && fastfetch"


# Move up >=1 directories
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ........="cd ../../../.."
alias home="cd ~"
alias pwd="echo $PWD"
alias cwd="echo $CWD"

# Tmux
alias tn="tmux new -As '$(basename "$PWD")'"
alias td="tmux detach"

# Terraform
alias tf="terraform"

# Kubernetes & Docker

# Kubectl
alias k="kubectl"
alias kap="kubectl apply"
alias kdl="kubectl delete"
alias kctx='kubectl config use-context $(kubectl config get-contexts -o name | fzf --height 40% --layout=reverse --border --exit-0)'

# Kustomize
alias kz="kustomize"
alias kzb="kustomize build"

# Docker
alias ld="lazydocker"
alias dd="docker desktop"
alias dco="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down -v --remove-orphans"
alias dcr="docker compose restart"
export DOCKER_HOST=unix:///var/run/docker.sock
# Git
alias gap="git add --patch"
alias gb="git branch"
alias gc="git checkout"
alias gcl="git clone"
alias gcnb='git checkout -b'
alias gco="git commit"
alias gd='git diff --pretty="" --name-only origin/master'
alias gi="git init"
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gnb="git checkout -b"
alias gp="git push"
alias gs="git status"
alias gpu="git pull"
alias lg="lazygit"

# modified commands
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias aptf="apt list | fzf --multi --preview 'apt show {1}' --preview-window=down:75% | xargs -ro sudo apt install"

# Neovim
alias snv="sudo nvim"
alias svi="sudo vim"
alias lv="NVIM_APPNAME=nvim-lite nvim"

# Plasma
alias pr="plasmashell --replace && systemctl --user restart plasma-plasmashell &"

# nmcli
alias vpnc="nmcli connection | fzf --multi --preview 'nmcli connection show {1}' --preview-window=down:75% --header-lines 1 --border=rounded --header-first --reverse | xargs -ro nmcli connection up"

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
        # fast-syntax-highlighting
        source $XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        # zsh-autocomplete
        source $XDG_DATA_HOME/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
        # zsh-autosuggestions
        source $XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
        # other completions
        source $XDG_DATA_HOME/zsh/site-functions
        ;;
esac

# ======================
# Python
# ======================

# activate venv
alias pyva="source .venv/bin/activate"
alias pyvd="deactivate"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init - bash)"
    eval "$(pyenv virtualenv-init -)"
fi

# ======================
# FZF
# ======================
source "${XDG_CONFIG_HOME}/zsh/fzf.zsh"

# ======================
# Starship
# ======================
source "${XDG_CONFIG_HOME}/starship/starship.zsh"

# ======================
# Work related
# ======================
source "${XDG_CONFIG_HOME}/gcloud/gcp.zsh"
source "${XDG_CONFIG_HOME}/wireguard/wireguard.zsh"
source "${HOME}/.dbt/dbt-completion.bash"
source "${HOME}/.pulumi/completion.zsh"

ff

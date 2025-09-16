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
        # macOS - check for both Intel and Apple Silicon paths
        if [[ -d "/opt/homebrew" ]]; then
            export BREW_PATH="/opt/homebrew"  # Apple Silicon
        elif [[ -d "/usr/local/Homebrew" ]]; then
            export BREW_PATH="/usr/local"     # Intel Mac
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
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/$BREW_PATH/bin:/usr/local/bin:$PATH"

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
alias ls="eza -a -h --color=always --long --git -T -L 1 --icons=always --no-user --no-permissions --no-filesize"

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
alias dd="docker desktop"
alias ld="lazydocker"
alias dcu="docker compose up -d"
alias dcd="docker compose down -v --remove-orphans"
alias dco="docker compose"

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
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# Neovim
alias snv="sudo nvim"
alias svi="sudo vim"
alias mvim="NVIM_APPNAME=nvim-minimal nvim"
alias lvim="NVIM_APPNAME=nvim-lite nvim"

# Plasma
alias pr="plasmashell --replace && systemctl --user restart plasma-plasmashell &"

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
        ;;
    linux)
        # fast-syntax-highlighting
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
        # zsh-autocomplete
        source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
        # zsh-autosuggestions
        source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
        ;;
esac

# ======================
# FZF Configuration
# ======================

# FZF settings
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# FZF completion functions
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Initialize fzf
eval "$(fzf --zsh)"

# ======================
# Neovim Config Picker
# ======================

# # Taken from Elijah Manor
# function nvims() {
#   items=("default" "minimal" "lite" "suckless")
#   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#   if [[ -z $config ]]; then
#     echo "Nothing selected"
#     return 0
#   elif [[ $config == "default" ]]; then
#     config=""
#   fi
#   NVIM_APPNAME=nvim-$config nvim $@
# }

# ======================
# Python
# ======================

# activate venv
alias pyva="source .venv/bin/activate"
alias pyvd="deactivate"

# Pyenv 
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init - bash)"
fi

# ======================
# Starship
# ======================
source "${XDG_CONFIG_HOME}/starship/starship.zsh"

# ======================
# Work related
# ======================
source "${XDG_CONFIG_HOME}/gcloud/gcp.zsh"
source "${XDG_CONFIG_HOME}/wireguard/wireguard.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oygiovannorachmat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oygiovannorachmat/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oygiovannorachmat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oygiovannorachmat/google-cloud-sdk/completion.zsh.inc'; fi

ff

# ======================
# Environment Variables
# ======================

# Set up PATH
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export TERM="xterm-256color"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

# Language and editor settings
export LANG=en_US.UTF-8

# Starship prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# bat theme
export BAT_THEME="Monokai Extended Bright"

autoload -Uz compinit; compinit -C

# ======================
# Zsh Completions
# ======================
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"

# ======================
# Zsh Plugins
# ======================

# fast-syntax-highlighting
source ~/.config/f-sy-h/F-Sy-H.plugin.zsh

# zsh-autocomplete
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ======================
# History Configuration
# ======================

HISTSIZE=100000
HISTFILE="$HOME/.cache/zsh/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Bind keys for history search
bindkey '^p' history-search-backward
bindkey '^o' history-search-forward

# ======================
# Aliases
# ======================

# Move up >=1 directories
alias home="cd ~"
alias pwd="echo $PWD"
alias cwd="echo $CWD"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias yz='yazi'
alias ze='zellij'

# Check directories
alias ls..="ls .."
alias ls....="ls ../.."

# Eza (better ls)
alias ls="eza -a -h --color=always --long --git -T -L 1 --icons=always --no-user --no-permissions --no-filesize"

# Terraform
alias tf="terraform"

# Git
alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"'
alias gdf='git diff --pretty="" --name-only origin/master'
alias gcb='git checkout -b'
alias gc='git checkout'

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oygiovannorachmat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oygiovannorachmat/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/oygiovannorachmat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oygiovannorachmat/google-cloud-sdk/completion.zsh.inc'; fi

alias gcal="gcloud auth login giovanno.rachmat@oyindonesia.com --project data-298904"
alias gcaal="gcloud auth application-default login --account giovanno.rachmat@oyindonesia.com --project data-298904"
alias vmdevstart="gcloud compute instances start bi-dev --zone=asia-southeast2-a"
alias vmdevstop="gcloud compute instances stop bi-dev --zone=asia-southeast2-a"
alias vmexpstart="gcloud compute instances start bi-experimental --zone=asia-southeast2-a"
alias vmexpstop="gcloud compute instances stop bi-experimental --zone=asia-southeast2-a"
alias awsdev="aws ecr get-login-password --region ap-southeast-3 | docker login --username AWS --password-stdin 862498237182.dkr.ecr.ap-southeast-3.amazonaws.com/oy-data-engineering-airflow-dev:latest"

# ======================
# FZF Customizations
# ======================
eval "$(fzf --zsh)"

# settings
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

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

# ======================
# Miscellaneous
# ======================

# envman
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


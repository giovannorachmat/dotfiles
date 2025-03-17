# ======================
# General ZSH settings
# ======================
# Set env vars
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export TERM=xterm-256color
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# History configuration
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.cache/zsh/.zsh_history"
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Compdump
autoload -Uz compinit; compinit -C -d $ZSH_COMPDUMP

# Bind keys for history search
bindkey '^p' history-search-backward
bindkey '^o' history-search-forward

# Set alias from .aliasrc
if [[ -r $XDG_CONFIG_HOME/zsh/.aliasrc ]]; then
  . $XDG_CONFIG_HOME/zsh/.aliasrc
fi

# ======================
# Syntax Highlighting
# ======================
# fast-syntax-highlighting
source $XDG_CONFIG_HOME/f-sy-h/F-Sy-H.plugin.zsh

# zsh-autocomplete
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $XDG_CONFIG_HOME/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# ======================
# gcloud CLI
# ======================
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

# Take alias from .gcloudalias
if [[ -r $HOME/.gcloudalias ]]; then
  . $HOME/.gcloudalias
fi

# ======================
# FZF Customizations
# ======================
# prompt
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

# Eza (better ls)
alias ls="eza -a -h --color=always --long --git -T -L 1 --icons=always --no-user --no-permissions --no-filesize"

# bat theme
export BAT_THEME="Monokai Extended Bright"

# ======================
# Starship
# ======================
# config path
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
# prompt
eval "$(starship init zsh)"

# ======================
# Neofetch
# ======================
# prompt
neofetch

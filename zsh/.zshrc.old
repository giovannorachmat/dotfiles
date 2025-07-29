
# ======================
# Environment Variables
# ======================

export ZSH_CONFIG_DIR="${HOME}/.config/zsh"

# Brew configuration
export BREW_PATH="/home/linuxbrew/.linuxbrew"
eval "$($BREW_PATH/bin/brew shellenv)"

# PATH configuration
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/$BREW_PATH/bin:/usr/local/bin:$PATH"

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
alias minvim="NVIM_APPNAME=nvim-minimal nvim"
alias litevim="NVIM_APPNAME=nvim-lite nvim"

# ======================
# Syntax Highlighting & Autosuggestions
# ======================

# fast-syntax-highlighting
# source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# zsh-autocomplete
# source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# zsh-autosuggestions
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

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

# Taken from Elijah Manor
function nvims() {
  items=("default" "minimal" "lite" "suckless")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=nvim-$config nvim $@
}

# ======================
# Starship
# ======================

# Starship configuration
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# Fix potential widget conflicts
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

# compdef starship

autoload -U is-at-least

_starship() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_starship_commands" \
"*::: :->starship" \
&& ret=0
    case $state in
    (starship)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:starship-command-$line[1]:"
        case $line[1] in
            (bug-report)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':shell:(bash elvish fish nushell power-shell zsh)' \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::name -- Configuration key to edit:_default' \
'::value -- Value to place into that key:_default' \
&& ret=0
;;
(explain)
_arguments "${_arguments_options[@]}" : \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS:_default' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'-j+[The number of currently running jobs]:JOBS:_default' \
'--jobs=[The number of currently running jobs]:JOBS:_default' \
'--shlvl=[The current value of SHLVL, for shells that mis-handle it in \$()]:SHLVL:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'--print-full-init[]' \
'-h[Print help]' \
'--help[Print help]' \
':shell:_default' \
&& ret=0
;;
(module)
_arguments "${_arguments_options[@]}" : \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS:_default' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'-j+[The number of currently running jobs]:JOBS:_default' \
'--jobs=[The number of currently running jobs]:JOBS:_default' \
'--shlvl=[The current value of SHLVL, for shells that mis-handle it in \$()]:SHLVL:_default' \
'-l[List out all supported modules]' \
'--list[List out all supported modules]' \
'-h[Print help]' \
'--help[Print help]' \
'::name -- The name of the module to be printed:_default' \
&& ret=0
;;
(preset)
_arguments "${_arguments_options[@]}" : \
'(-l --list)-o+[Output the preset to a file instead of stdout]:OUTPUT:_files' \
'(-l --list)--output=[Output the preset to a file instead of stdout]:OUTPUT:_files' \
'-l[List out all preset names]' \
'--list[List out all preset names]' \
'-h[Print help]' \
'--help[Print help]' \
'::name -- The name of preset to be printed:(bracketed-segments catppuccin-powerline gruvbox-rainbow jetpack nerd-font-symbols no-empty-icons no-nerd-font no-runtime-versions pastel-powerline plain-text-symbols pure-preset tokyo-night)' \
&& ret=0
;;
(print-config)
_arguments "${_arguments_options[@]}" : \
'-d[Print the default instead of the computed config]' \
'--default[Print the default instead of the computed config]' \
'-h[Print help]' \
'--help[Print help]' \
'*::name -- Configuration keys to print:_default' \
&& ret=0
;;
(prompt)
_arguments "${_arguments_options[@]}" : \
'(--right)--profile=[Print the prompt with the specified profile name (instead of the standard left prompt)]:PROFILE:_default' \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS:_default' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'-j+[The number of currently running jobs]:JOBS:_default' \
'--jobs=[The number of currently running jobs]:JOBS:_default' \
'--shlvl=[The current value of SHLVL, for shells that mis-handle it in \$()]:SHLVL:_default' \
'--right[Print the right prompt (instead of the standard left prompt)]' \
'(--right --profile)--continuation[Print the continuation prompt (instead of the standard left prompt)]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(session)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(time)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(timings)
_arguments "${_arguments_options[@]}" : \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE:_default' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS:_default' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH:_default' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION:_default' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP:_default' \
'-j+[The number of currently running jobs]:JOBS:_default' \
'--jobs=[The number of currently running jobs]:JOBS:_default' \
'--shlvl=[The current value of SHLVL, for shells that mis-handle it in \$()]:SHLVL:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(toggle)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':name -- The name of the module to be toggled:_default' \
'::value -- The key of the config to be toggled:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_starship__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:starship-help-command-$line[1]:"
        case $line[1] in
            (bug-report)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(explain)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(module)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(preset)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(print-config)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(prompt)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(session)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(time)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(timings)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(toggle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_starship_commands] )) ||
_starship_commands() {
    local commands; commands=(
'bug-report:Create a pre-populated GitHub issue with information about your configuration' \
'completions:Generate starship shell completions for your shell to stdout' \
'config:Edit the starship configuration' \
'explain:Explains the currently showing modules' \
'init:Prints the shell function used to execute starship' \
'module:Prints a specific prompt module' \
'preset:Prints a preset config' \
'print-config:Prints the computed starship configuration' \
'prompt:Prints the full starship prompt' \
'session:Generate random session key' \
'time:Prints time in milliseconds' \
'timings:Prints timings of all active modules' \
'toggle:Toggle a given starship module' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'starship commands' commands "$@"
}
(( $+functions[_starship__bug-report_commands] )) ||
_starship__bug-report_commands() {
    local commands; commands=()
    _describe -t commands 'starship bug-report commands' commands "$@"
}
(( $+functions[_starship__completions_commands] )) ||
_starship__completions_commands() {
    local commands; commands=()
    _describe -t commands 'starship completions commands' commands "$@"
}
(( $+functions[_starship__config_commands] )) ||
_starship__config_commands() {
    local commands; commands=()
    _describe -t commands 'starship config commands' commands "$@"
}
(( $+functions[_starship__explain_commands] )) ||
_starship__explain_commands() {
    local commands; commands=()
    _describe -t commands 'starship explain commands' commands "$@"
}
(( $+functions[_starship__help_commands] )) ||
_starship__help_commands() {
    local commands; commands=(
'bug-report:Create a pre-populated GitHub issue with information about your configuration' \
'completions:Generate starship shell completions for your shell to stdout' \
'config:Edit the starship configuration' \
'explain:Explains the currently showing modules' \
'init:Prints the shell function used to execute starship' \
'module:Prints a specific prompt module' \
'preset:Prints a preset config' \
'print-config:Prints the computed starship configuration' \
'prompt:Prints the full starship prompt' \
'session:Generate random session key' \
'time:Prints time in milliseconds' \
'timings:Prints timings of all active modules' \
'toggle:Toggle a given starship module' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'starship help commands' commands "$@"
}
(( $+functions[_starship__help__bug-report_commands] )) ||
_starship__help__bug-report_commands() {
    local commands; commands=()
    _describe -t commands 'starship help bug-report commands' commands "$@"
}
(( $+functions[_starship__help__completions_commands] )) ||
_starship__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'starship help completions commands' commands "$@"
}
(( $+functions[_starship__help__config_commands] )) ||
_starship__help__config_commands() {
    local commands; commands=()
    _describe -t commands 'starship help config commands' commands "$@"
}
(( $+functions[_starship__help__explain_commands] )) ||
_starship__help__explain_commands() {
    local commands; commands=()
    _describe -t commands 'starship help explain commands' commands "$@"
}
(( $+functions[_starship__help__help_commands] )) ||
_starship__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'starship help help commands' commands "$@"
}
(( $+functions[_starship__help__init_commands] )) ||
_starship__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'starship help init commands' commands "$@"
}
(( $+functions[_starship__help__module_commands] )) ||
_starship__help__module_commands() {
    local commands; commands=()
    _describe -t commands 'starship help module commands' commands "$@"
}
(( $+functions[_starship__help__preset_commands] )) ||
_starship__help__preset_commands() {
    local commands; commands=()
    _describe -t commands 'starship help preset commands' commands "$@"
}
(( $+functions[_starship__help__print-config_commands] )) ||
_starship__help__print-config_commands() {
    local commands; commands=()
    _describe -t commands 'starship help print-config commands' commands "$@"
}
(( $+functions[_starship__help__prompt_commands] )) ||
_starship__help__prompt_commands() {
    local commands; commands=()
    _describe -t commands 'starship help prompt commands' commands "$@"
}
(( $+functions[_starship__help__session_commands] )) ||
_starship__help__session_commands() {
    local commands; commands=()
    _describe -t commands 'starship help session commands' commands "$@"
}
(( $+functions[_starship__help__time_commands] )) ||
_starship__help__time_commands() {
    local commands; commands=()
    _describe -t commands 'starship help time commands' commands "$@"
}
(( $+functions[_starship__help__timings_commands] )) ||
_starship__help__timings_commands() {
    local commands; commands=()
    _describe -t commands 'starship help timings commands' commands "$@"
}
(( $+functions[_starship__help__toggle_commands] )) ||
_starship__help__toggle_commands() {
    local commands; commands=()
    _describe -t commands 'starship help toggle commands' commands "$@"
}
(( $+functions[_starship__init_commands] )) ||
_starship__init_commands() {
    local commands; commands=()
    _describe -t commands 'starship init commands' commands "$@"
}
(( $+functions[_starship__module_commands] )) ||
_starship__module_commands() {
    local commands; commands=()
    _describe -t commands 'starship module commands' commands "$@"
}
(( $+functions[_starship__preset_commands] )) ||
_starship__preset_commands() {
    local commands; commands=()
    _describe -t commands 'starship preset commands' commands "$@"
}
(( $+functions[_starship__print-config_commands] )) ||
_starship__print-config_commands() {
    local commands; commands=()
    _describe -t commands 'starship print-config commands' commands "$@"
}
(( $+functions[_starship__prompt_commands] )) ||
_starship__prompt_commands() {
    local commands; commands=()
    _describe -t commands 'starship prompt commands' commands "$@"
}
(( $+functions[_starship__session_commands] )) ||
_starship__session_commands() {
    local commands; commands=()
    _describe -t commands 'starship session commands' commands "$@"
}
(( $+functions[_starship__time_commands] )) ||
_starship__time_commands() {
    local commands; commands=()
    _describe -t commands 'starship time commands' commands "$@"
}
(( $+functions[_starship__timings_commands] )) ||
_starship__timings_commands() {
    local commands; commands=()
    _describe -t commands 'starship timings commands' commands "$@"
}
(( $+functions[_starship__toggle_commands] )) ||
_starship__toggle_commands() {
    local commands; commands=()
    _describe -t commands 'starship toggle commands' commands "$@"
}

if [ "$funcstack[1]" = "_starship" ]; then
    _starship "$@"
else
    compdef _starship starship
fi

# Initialize starship
eval "$(starship init zsh)"


# ======================
# Work related
# ======================
source "${ZSH_CONFIG_DIR}/gcp.zsh"
source "${ZSH_CONFIG_DIR}/wireguard.zsh"

ff

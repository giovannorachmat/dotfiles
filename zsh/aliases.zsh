# ======================
# Aliases
# ======================

# Eza (better ls)
alias ls="eza -lah --color=always --long --git -T -L 1 --icons=always --no-filesize"

# Tree view
alias tree='eza --tree --icons'

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
alias tf="tofu"

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
alias gwa="git worktree add"
alias gwr="git worktree remove"
alias gwl="git worktree list"
alias lg="lazygit"

# core
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

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

# Kill chrome when profile locked
alias rm-chrome="rm -f $XDG_CONFIG_HOME/google-chrome/Singleton*"

# activate venv
alias pyva="source .venv/bin/activate"
alias pyvd="deactivate"

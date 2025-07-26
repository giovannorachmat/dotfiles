# ======================
# General Aliases
# ======================

# Eza (better ls)
alias ls="eza -a -h --color=always --long --git -T -L 1 --icons=always --no-user --no-permissions --no-filesize"

# System info
alias fastfetch="clear && fastfetch"
alias ff="fastfetch"

# LazyVim
alias lazyvim="NVIM_APPNAME=nvim-LazyVim nvim"

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

# Terraform
alias tf="terraform"

# ======================
# Kubernetes & Docker
# ======================

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

# ======================
# Git
# ======================

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
alias gpu="git push"
alias gs="git status"
alias gu="git pull"

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

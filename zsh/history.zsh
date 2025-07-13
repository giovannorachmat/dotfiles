# ======================
# Options
# ======================

# History configuration
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.cache/zsh/.zsh_history"
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"

# History options
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups 
setopt hist_save_no_dups 
setopt hist_ignore_dups 
setopt hist_find_no_dups

# ======================
# Options
# ======================

# History configuration
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.cache/zsh/.zsh_history"
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"

# Compdump
autoload -Uz compinit; compinit -C -d $ZSH_COMPDUMP

# History options
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

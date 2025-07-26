# Alias
alias snv="sudo nvim"
alias svi="sudo vim"

# ======================
# Neovim Config Picker
# ======================
# Taken from Elijah Manor

function nvims() {
  items=("default" "LazyVim" "suckless")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=nvim-$config nvim $@
}

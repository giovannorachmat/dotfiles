# giografi dotfiles

Created this so I don't have to manually install the tools that I frequently use everytime I switch between systems (currently Linux and MacOS).

### Tools used
Main Shell
- zsh

File Explorer
- yazi

Visuals
- fastfetch
- starship

Quality of Life
- fzf
- fd or fd-find
- bat
- zsh-autocomplete
- zsh-autosuggestions
- zsh-syntax-highlighting
- zoxide
- lazygit
- lazydocker

Keyboard shortcuts
- kanata

System updater
- topgrade

Multiplexer
- herdr
- tmux

Terminal
- kitty
- alacritty
- ghostty
- wezterm

Editors
- neovim
- vscode or codium
- zed

> [!NOTE]
- `.zshenv` must be in the home directory. Type `echo $HOME`
- Change shell from bash to zsh after install. Type `chsh -s $(which zsh)`
- Kitty is the main terminal. Tried Alacritty, Ghostty, and Wezterm, but I stuck with kitty
- Herdr is the main multiplexer. Tried tmux for a years, and I like Herdr better.
- Install packages with `bash installer/packages.sh` (Fedora or macOS)
- VSCodium settings: symlink `vscode/settings.json` to `~/.config/VSCodium/User/settings.json` (Linux) or `~/Library/Application Support/VSCodium/User/settings.json` (macOS)

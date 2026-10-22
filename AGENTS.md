# AGENTS.md

Guidance for agents working in this dotfiles repo. Each top-level directory is a self-contained tool config (alacritty, ghostty, kitty, wezterm, zsh, nvim, etc.).

## Layout & deploy model

- **GNU Stow** manages deployment, run **manually** — neither installer script stows anything. `.stowrc` (repo root) sets `--target=~/.config` and ignores `.gitignore`, `.stowrc`, `.zcompdump`, `.zprofile`, `.zsh_sessions/`, `.DS_Store`. Each top-level dir = one stow package: `stow <dir>` from the repo root.
- Platform-specific configs live in OS subfolders, e.g. `kanata/linux/` and `kanata/mac/` — keep both in sync when changing shared behavior.
- `zsh/.zshenv` is the one exception to stow: it must additionally be symlinked to `~/.zshenv` manually (see `zsh/NOTE.md`), because `ZDOTDIR` only resolves after the shell reads it. `ZDOTDIR` is set to `~/.config/zsh` inside it, so `~/.config/zsh` holds the rest of the zsh files.

## Install / setup

- Packages install via `bash installer/packages.sh` — self-contained, dispatches `install_fedora` (dnf) or `install_macos` (brew) based on `uname -s`. `installer/fedora.sh` is a separate, larger Fedora-only script that additionally sets up DankLinux and more dnf packages. Both are plain bash scripts, not a framework — edit in place.
- Plugin paths differ per OS: `.zshrc` branches between `$(brew --prefix)/share/...` (mac) and `/usr/share/...` (Fedora) for zsh-syntax-highlighting/autosuggestions/autocomplete. Respect those branches when touching `.zshrc`.

## Key choices (README-confirmed; don't silently change)

- Kitty is the **main** terminal; alacritty/ghostty/wezterm configs are kept but secondary. Herdr is the **main** multiplexer; tmux is legacy. Heavier, high-traffic edits belong to kitty/herdr/nvim.
- `nvim/` is [LazyVim](https://lazyvim.github.io) structured (`lua/config/lazy.lua` bootstrap, `lua/plugins/` specs, `lua/lualine/`, `lua/themes/`). `nvim-lite/` is a separate hand-rolled single-file setup (`init.lua`). Don't mix them. Both plugin lockfiles (`nvim/lazy-lock.json`, `nvim-lite/nvim-pack-lock.json`) are gitignored — local state only.
- `.gitignore` is a large copied Python template; the dotfile-specific entries are at the bottom (lazy-lock, zsh/.zcompdump, tmux/plugins, `opencode/bin/`). Add new ignores there, not via another mechanism.

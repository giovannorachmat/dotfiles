#!/usr/bin/env bash
# =============================================================================
# Fedora Post-Install Setup Script
# =============================================================================
# Pre-install note: During OS installation, use "Fedora Everything" ISO with:
#   - Base Environment: Custom Operating System
#   - Additional software: Standard, Common NetworkManager Submodules
# =============================================================================

set -euo pipefail

# -----------------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------------

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { echo -e "${CYAN}${BOLD}==> ${RESET}${BOLD}$*${RESET}"; }
success() { echo -e "${GREEN}${BOLD}  ✓ ${RESET}$*"; }
warn()    { echo -e "${YELLOW}${BOLD}  ! ${RESET}$*"; }
die()     { echo -e "${RED}${BOLD}  ✗ Error on line ${BASH_LINENO[0]}: $*${RESET}" >&2; exit 1; }

trap 'die "Unexpected failure. See above output for details."' ERR

require_non_root() {
  [[ $EUID -ne 0 ]] || die "Do not run this script as root. It will call sudo as needed."
}

require_fedora() {
  [[ -f /etc/fedora-release ]] || die "This script is intended for Fedora only."
}

require_sudo() {
  sudo -v || die "Could not obtain sudo privileges."
  # Keep sudo alive for the duration of the script
  while true; do sudo -n true; sleep 60; kill -0 "$$" 2>/dev/null || exit; done &
  SUDO_KEEPALIVE_PID=$!
  trap 'kill "$SUDO_KEEPALIVE_PID" 2>/dev/null; die "Unexpected failure."' ERR
  trap 'kill "$SUDO_KEEPALIVE_PID" 2>/dev/null' EXIT
}

copr_enabled() {
  sudo dnf copr list --enabled 2>/dev/null | grep -q "^$1$"
}

# -----------------------------------------------------------------------------
# Preflight
# -----------------------------------------------------------------------------

info "Running preflight checks"
require_non_root
require_fedora
require_sudo
success "Preflight passed"

FEDORA_VER=$(rpm -E %fedora)

# -----------------------------------------------------------------------------
# Repos: RPMFusion
# -----------------------------------------------------------------------------

info "Setting up RPMFusion repos"

RPMFUSION_FREE="/etc/yum.repos.d/rpmfusion-free.repo"
RPMFUSION_NONFREE="/etc/yum.repos.d/rpmfusion-nonfree.repo"

if [[ ! -f "$RPMFUSION_FREE" ]]; then
  sudo dnf install -y \
    "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VER}.noarch.rpm"
  success "RPMFusion Free installed"
else
  warn "RPMFusion Free already present, skipping"
fi

if [[ ! -f "$RPMFUSION_NONFREE" ]]; then
  sudo dnf install -y \
    "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${FEDORA_VER}.noarch.rpm"
  success "RPMFusion Nonfree installed"
else
  warn "RPMFusion Nonfree already present, skipping"
fi

# -----------------------------------------------------------------------------
# Repos: Terra
# -----------------------------------------------------------------------------

info "Setting up Terra repo"

TERRA_REPO="/etc/yum.repos.d/terra.repo"

if [[ ! -f "$TERRA_REPO" ]]; then
  sudo dnf install -y --nogpgcheck \
    --repofrompath "terra,https://repos.fyralabs.com/terra\$releasever" \
    terra-release
  success "Terra repo installed"
else
  warn "Terra repo already present, skipping"
fi

# -----------------------------------------------------------------------------
# Repos: Lens
# -----------------------------------------------------------------------------

info "Setting up Lens (k8s) repo"

LENS_REPO="$HOME/.config/Lens"

if [[ ! -f "$LENS_REPO" ]]; then
  sudo dnf config-manager addrepo \
    --from-repofile=https://downloads.k8slens.dev/rpm/lens.repo
  success "Lens repo installed"
else
  warn "Lens repo already present, skipping"
fi

# -----------------------------------------------------------------------------
# Repos: COPR
# -----------------------------------------------------------------------------

info "Setting up COPR repos"

COPRS=(
  "agriffis/neovim-nightly"
  "avengemedia/dms"
  "brycensranch/gpu-screen-recorder-git"
  "goncalossilva/act"
  "lilay/topgrade"
  "wojnilowicz/ungoogled-chromium"
  "che/nerd-fonts"
)

for copr in "${COPRS[@]}"; do
  if ! copr_enabled "$copr"; then
    sudo dnf copr enable -y "$copr"
    success "COPR $copr enabled"
  else
    warn "COPR $copr already enabled, skipping"
  fi
done

# -----------------------------------------------------------------------------
# Repos: HashiCorp
# -----------------------------------------------------------------------------

info "Setting up HashiCorp repo"

HASHICORP_REPO="/etc/yum.repos.d/hashicorp.repo"

if [[ ! -f "$HASHICORP_REPO" ]]; then
  sudo dnf install -y dnf-plugins-core
  sudo dnf config-manager addrepo \
    --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
  success "HashiCorp repo installed"
else
  warn "HashiCorp repo already present, skipping"
fi

# -----------------------------------------------------------------------------
# DNF Packages
# -----------------------------------------------------------------------------

info "Installing DNF packages"

sudo dnf install -y \
  act \
  akmod-nvidia \
  bat \
  btop \
  codium \
  colord \
  curl \
  ddcutil \
  docker-cli \
  docker-compose \
  eza \
  fastfetch \
  fd-find \
  ffmpeg-free \
  flatpak \
  fzf \
  gh \
  ghostty \
  git \
  gnome-keyring \
  golang-github-jesseduffield-lazygit \
  gpu-screen-recorder-ui \
  helm \
  jetbrains-mono-fonts-all \
  k9s \
  kustomize \
  lens \
  man-db \
  man-pages \
  nautilus \
  neovim \
  openresolv \
  opensc \
  openssh-clients \
  openssh-server \
  opentofu \
  pipewire \
  pre-commit \
  python3-pip \
  python3-poetry \
  python3-uv \
  qalculate \
  rsync \
  scrcpy \
  slurp \
  starship \
  stow \
  syncthing \
  tailscale \
  tmux \
  topgrade \
  trash-cli \
  tree \
  wireguard-tools \
  wireplumber \
  xdg-desktop-portal-gnome \
  xdg-desktop-portal-gtk \
  yazi \
  zip \
  zoxide \
  zsh \
  zsh-autocomplete \
  zsh-autosuggestions \
  zsh-syntax-highlighting

success "DNF packages installed"

# -----------------------------------------------------------------------------
# DankLinux
# -----------------------------------------------------------------------------

info "Setting up DankLinux"

if ! command -v dms &>/dev/null; then
  curl -fsSL https://install.danklinux.com | sh
  success "DankLinux installed"
else
  warn "dms already installed, skipping install"
fi

info "Enabling DankLinux greeter"
dms greeter enable
success "DankLinux greeter enabled"

# -----------------------------------------------------------------------------
# dconf: Dark Mode
# -----------------------------------------------------------------------------

info "Setting GNOME dark mode"
dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'
success "Dark mode enabled"

# -----------------------------------------------------------------------------
# Rust
# -----------------------------------------------------------------------------

info "Setting up Rust via rustup"

if [[ ! -x "${HOME}/.cargo/bin/rustup" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  success "Rust installed"
else
  warn "rustup already installed, skipping"
fi

info "Install dtop"

if [[ ! -x "${HOME}/.config/dtop" ]]; then
  cargo install dtop
  success "dtop installed"
else
  warn "dtop already installed, skipping"
fi

# -----------------------------------------------------------------------------
# Go
# -----------------------------------------------------------------------------

info "Setting up Go"

GO_LATEST=$(curl -fsSL "https://go.dev/VERSION?m=text" | head -1)
GO_INSTALLED=""

if [[ -x /usr/local/go/bin/go ]]; then
  GO_INSTALLED=$(/usr/local/go/bin/go version | awk '{print $3}')
fi

if [[ "$GO_INSTALLED" == "$GO_LATEST" ]]; then
  warn "Go ${GO_LATEST} already installed, skipping"
else
  info "Installing Go ${GO_LATEST}"
  GO_TARBALL="${GO_LATEST}.linux-amd64.tar.gz"
  GO_URL="https://dl.google.com/go/${GO_TARBALL}"
  TMPDIR=$(mktemp -d)

  curl -fsSL "$GO_URL" -o "${TMPDIR}/${GO_TARBALL}"
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf "${TMPDIR}/${GO_TARBALL}"
  rm -rf "$TMPDIR"

  success "Go ${GO_LATEST} installed to /usr/local/go"
fi

# -----------------------------------------------------------------------------
# Default Shell: zsh
# -----------------------------------------------------------------------------

info "Setting default shell to zsh"

ZSH_BIN=$(which zsh)

if [[ "$SHELL" == "$ZSH_BIN" ]]; then
  warn "zsh is already the default shell, skipping"
else
  grep -qxF "$ZSH_BIN" /etc/shells || die "$ZSH_BIN not found in /etc/shells — is zsh installed?"
  chsh -s "$ZSH_BIN"
  success "Default shell changed to zsh (takes effect on next login)"
fi

# -----------------------------------------------------------------------------
# Done
# -----------------------------------------------------------------------------

echo ""
echo -e "${GREEN}${BOLD}============================================${RESET}"
echo -e "${GREEN}${BOLD}  Setup complete!${RESET}"
echo -e "${GREEN}${BOLD}============================================${RESET}"
echo ""
echo -e "  A few things to do manually:"
echo -e "  ${BOLD}·${RESET} Add /usr/local/go/bin to your PATH (e.g. in ~/.zshrc or ~/.profile)"
echo -e "  ${BOLD}·${RESET} Source ~/.cargo/env or restart your shell for Rust"
echo -e "  ${BOLD}·${RESET} Log out and back in for the zsh shell change to take effect"
echo ""
#!/usr/bin/env bash
set -euo pipefail

# Installs only portable Linux configurations. This script is intentionally
# not run automatically; inspect the files and run it on the new system.
command -v stow >/dev/null 2>&1 || {
  printf '%s\n' 'GNU Stow is required (install it first).' >&2
  exit 1
}

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$repo_dir"

# Oh My Zsh and the two external plugins are installed separately from the
# dotfiles. The pinned revisions are documented in zshrc-linux/omz.lock.
install_repo_if_missing() {
  local url=$1
  local destination=$2
  local revision=$3

  if [[ -e "$destination" ]]; then
    if [[ ! -d "$destination/.git" ]]; then
      printf 'Path exists but is not a Git repository: %s\n' "$destination" >&2
      exit 1
    fi
    printf 'Keeping existing repository: %s\n' "$destination"
    return
  fi

  git clone "$url" "$destination"
  git -C "$destination" checkout --detach "$revision"
}

install_repo_if_missing \
  https://github.com/ohmyzsh/ohmyzsh.git \
  "$HOME/.oh-my-zsh" \
  d745fbf3bd49a5038e089d7d343ca89db0cbaaff
install_repo_if_missing \
  https://github.com/zsh-users/zsh-autosuggestions.git \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" \
  85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5
install_repo_if_missing \
  https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" \
  5eb677bb0fa9a3e60f0eff031dc13926e093df92

stow --target="$HOME/.config" \
  nvim opencode starship foot fuzzel kitty zed
stow --target="$HOME" zshrc-linux bashrc-linux

printf '%s\n' 'Linux dotfiles installed. Credentials were intentionally not included.'

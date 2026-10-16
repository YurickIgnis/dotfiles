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

stow --target="$HOME/.config" \
  nvim opencode starship foot fuzzel kitty zed
stow --target="$HOME" zshrc-linux bashrc-linux

printf '%s\n' 'Linux dotfiles installed. Credentials were intentionally not included.'

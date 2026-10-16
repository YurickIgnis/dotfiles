# Dotfiles

The repository contains portable configuration plus some macOS-specific
packages. The `master` branch is the original configuration; the
`linux-current-backup-*` branch contains the Linux configuration captured
before migrating to Omarchy.

## Linux / Omarchy

The Linux branch includes current configurations for Neovim, OpenCode,
Zsh, Bash, Starship, Foot, Fuzzel, Kitty and Zed. Install GNU Stow, review
the files, then run:

```bash
./install-linux.sh
```

The script does not use `--adopt`, overwrite existing files, or install
credentials. If Stow reports a conflict, make a backup and resolve it
manually before retrying.

OpenCode credentials and local runtime state are deliberately excluded from
Git. Restore them from your private backup or configure them again on the
new system. For shell-based credentials, copy `private-env.example` to
`~/.config/dotfiles.env`, fill it locally, and keep its permissions at `600`.

## Original Stow setup

The macOS-oriented packages can still be installed with the original setup:

```bash
./setup.sh
```

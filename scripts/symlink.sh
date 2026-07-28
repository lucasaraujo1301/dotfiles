#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_SRC="$DOTFILES_DIR/config"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link() {
    local src="$1"
    local dest="$2"

    mkdir -p "$(dirname "$dest")"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "==> Backing up existing $dest"
        mkdir -p "$BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    ln -sfn "$src" "$dest"
    echo "==> Linked $dest -> $src"
}

link "$CONFIG_SRC/fish/config.fish" "$HOME/.config/fish/config.fish"
link "$CONFIG_SRC/starship.toml" "$HOME/.config/starship.toml"
link "$CONFIG_SRC/ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"

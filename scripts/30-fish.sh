#!/usr/bin/env bash
set -euo pipefail

if command -v fish &> /dev/null; then
    echo "==> fish already installed, skipping"
else
    echo "==> Installing fish shell"
    sudo apt-add-repository -y ppa:fish-shell/release-4
    sudo apt-get update
    sudo apt-get install -y fish
fi

FISH_PATH="$(command -v fish)"
if [ "$SHELL" != "$FISH_PATH" ]; then
    echo "==> Setting fish as default shell"
    grep -qxF "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
fi

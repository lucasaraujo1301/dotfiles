#!/usr/bin/env bash
set -euo pipefail

if command -v brew &> /dev/null; then
    BREW_BIN="$(command -v brew)"
    echo "==> Homebrew already installed, skipping"
elif [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
    echo "==> Homebrew already installed, skipping"
elif [ -x "/opt/homebrew/bin/brew" ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
    echo "==> Homebrew already installed, skipping"
elif [ -x "/usr/local/bin/brew" ]; then
    BREW_BIN="/usr/local/bin/brew"
    echo "==> Homebrew already installed, skipping"
else
    echo "==> Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
        BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
    elif [ -x "/opt/homebrew/bin/brew" ]; then
        BREW_BIN="/opt/homebrew/bin/brew"
    else
        BREW_BIN="/usr/local/bin/brew"
    fi
fi

# Add brew to PATH for this run and persist it for future shells.
eval "$("$BREW_BIN" shellenv)"

mkdir -p "$HOME/.config/fish/conf.d"
echo "$BREW_BIN shellenv | source" > "$HOME/.config/fish/conf.d/homebrew.fish"

grep -qxF "eval \"\$($BREW_BIN shellenv)\"" "$HOME/.bashrc" 2>/dev/null || \
    echo "eval \"\$($BREW_BIN shellenv)\"" >> "$HOME/.bashrc"

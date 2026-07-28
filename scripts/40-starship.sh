#!/usr/bin/env bash
set -euo pipefail

if command -v starship &> /dev/null; then
    echo "==> starship already installed, skipping"
else
    echo "==> Installing starship prompt via brew"
    brew install starship
fi

#!/usr/bin/env bash
set -euo pipefail

if command -v ghostty &> /dev/null; then
    echo "==> Ghostty already installed, skipping"
else
    echo "==> Installing Ghostty"

    if apt-cache show ghostty &> /dev/null; then
        sudo apt-get install -y ghostty
    else
        sudo add-apt-repository -y ppa:mkasberg/ghostty-ubuntu
        sudo apt-get update
        sudo apt-get install -y ghostty
    fi
fi

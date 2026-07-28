#!/usr/bin/env bash
set -euo pipefail

if command -v rtk &> /dev/null; then
    echo "==> rtk already installed, skipping"
else
    echo "==> Installing rtk via brew"
    brew install rtk
fi

#!/usr/bin/env bash
set -euo pipefail

if command -v uv &> /dev/null; then
    echo "==> uv already installed, skipping"
else
    echo "==> Installing uv (Python package manager) via brew"
    brew install uv
fi

#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for script in "$DOTFILES_DIR"/scripts/*.sh; do
    echo "==> Running $(basename "$script")"
    # shellcheck source=/dev/null
    source "$script"
done

echo "Done. Restart your shell (or log out/in) to apply changes."

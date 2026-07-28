#!/usr/bin/env bash
set -euo pipefail

echo "==> Updating apt and installing base tools"
sudo apt-get update
sudo apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    file \
    procps \
    ca-certificates \
    gnupg \
    apt-transport-https \
    software-properties-common

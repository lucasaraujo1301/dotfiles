#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing PostgreSQL + SQLite dev dependencies"
sudo apt-get update
sudo apt-get install -y \
    libpq-dev \
    postgresql-client \
    libsqlite3-dev \
    sqlite3

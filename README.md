# Dotfiles

Personal development environment for Ubuntu and Pop!_OS.

## What's Included

- Fish 4 with aliases, completions, and automatic Starship initialization
- Ghostty configuration with a Synthwave theme, tabs, and split-pane keybindings
- Starship prompt configuration
- Docker Engine with Buildx, Compose, and a `docker-compose` compatibility shim
- Homebrew for Linux with `bat`, `lsd`, and `ripgrep`
- Python tooling through `uv`
- RTK command-output compaction
- PostgreSQL and SQLite clients and development libraries
- OpenCode configuration files under `config/opencode/`

## Installation

The installer targets Ubuntu-based distributions and requires a user with
`sudo` access.

```bash
git clone git@github.com:lucasaraujo1301/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh scripts/*.sh
./install.sh
```

The scripts are idempotent and can be run again to update or repair the setup.
Existing regular configuration files are moved to a timestamped directory under
`~/.dotfiles-backup/` before these files are linked:

- `~/.config/fish/config.fish`
- `~/.config/starship/starship.toml`
- `~/.config/ghostty/config.ghostty`
- `~/.config/opencode/opencode.json`
- `~/.config/opencode/AGENTS.md`

Restart the shell or log out and back in after installation so the Fish default
shell and Docker group membership take effect.

## Structure

```text
config/       Application configuration files
scripts/      Ordered installation and symlink scripts
install.sh    Main installer
```

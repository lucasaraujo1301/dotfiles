# Dotfiles

Personal configuration for Ubuntu and Pop!_OS.

## Install

```bash
git clone git@github.com:<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh scripts/*.sh
./install.sh
```

The installers are idempotent and may be run again. Restart the shell or log
out and back in afterward so the Fish default shell and Docker group membership
take effect.

See [`FEATURE.md`](FEATURE.md) for implementation details.

# ==============================================================================
# 1. GLOBAL ENVIRONMENT & PATHS (Runs in both interactive & background scripts)
# ==============================================================================

# Homebrew Environment
if test -d /home/linuxbrew/.linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# System PATH Additions
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Default Terminal Editor
set -Ux EDITOR "nano"

# ==============================================================================
# 2. INTERACTIVE SESSION CONFIG (Runs only when opening Ghostty / terminal)
# ==============================================================================
if status is-interactive
    # Tell Starship where your config file lives
    set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml

    # --- Auto-Start SSH Agent ---
    if not set -q SSH_AUTH_SOCK
        eval (ssh-agent -c) > /dev/null
    end

    # --- Modern CLI Replacements ---
    alias ls="lsd -l --group-dirs first --date relative --permission octal"
    alias lst="lsd -l --group-dirs first --date relative --permission octal --tree --depth 2"
    alias cat="bat"
    alias grep="rg"

    # --- Editors & Navigation ---
    alias c="code ."
    alias n="nano"
    alias p="cd ~/Documents"

    # --- Git Shortcuts ---
    alias gits="git status"
    alias gitp="git checkout master; git pull"
    alias gitr="git reset --hard HEAD"
    alias gitcf="git commit --amend; git push -f"

    # --- Docker & Docker Compose ---
    alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
    alias dstop="docker stop (docker ps -q)"
    alias drmc="docker rm (docker ps -a -q)"
    alias dclean="docker system prune -f"
    alias dkara="docker system prune -a --volumes -f" # Cleans all containers, images & volumes

    alias dup="docker compose up -d"
    alias ddown="docker compose down"
    alias dlogs="docker compose logs -f"
    alias dbuild="docker compose up -d --build"

    # --- Zellij Multiplexer ---
    alias z="zellij"
    alias za="zellij attach"
    alias zls="zellij list-sessions"

    function zn
        if set -q ZELLIJ
            echo "Already inside a Zellij session!"
        else
            set -l session_name (basename (pwd) | tr '.' '_')
            zellij attach -c $session_name
        end
    end

    # --- Tool Integrations & Shell Completions ---

    # Python (uv) Autocompletions
    if type -q uv
        uv generate-shell-completion fish | source
        uvx --generate-shell-completion fish | source
    end

    # Node.js (fnm) Automatic Version Switching on 'cd'
    if type -q fnm
        fnm env --use-on-cd --shell fish | source
    end

    # Starship Prompt Initialization
    if type -q starship
        starship init fish | source
    end

end
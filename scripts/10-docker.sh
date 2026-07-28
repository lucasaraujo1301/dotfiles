#!/usr/bin/env bash
set -euo pipefail

if command -v docker &> /dev/null && \
   docker compose version &> /dev/null && \
   docker buildx version &> /dev/null; then
    echo "==> Docker already installed, skipping"
else
    echo "==> Installing Docker Engine + Compose plugin"

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    . /etc/os-release
    DOCKER_CODENAME="${UBUNTU_CODENAME:-$VERSION_CODENAME}"

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu $DOCKER_CODENAME stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
fi

# Run docker without sudo, including when Docker was already installed.
sudo groupadd --force docker
sudo usermod -aG docker "$USER"

# Legacy docker-compose command shim forwards to docker compose.
if ! command -v docker-compose &> /dev/null; then
    echo "==> Adding docker-compose shim"
    sudo tee /usr/local/bin/docker-compose > /dev/null << 'EOF'
#!/usr/bin/env bash
exec docker compose "$@"
EOF
    sudo chmod +x /usr/local/bin/docker-compose
fi

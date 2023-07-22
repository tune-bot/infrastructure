#!/bin/bash

# Create directories
mkdir -p /tmp/tune-bot
mkdir -p library
mkdir -p bin

# Install dependencies
apt update
apt upgrade -y
apt install -y curl git mysql-server python-is-python3
apt remove golang -y
apt autoremove -y

# Remove old Go versions and install Go v1.20
CUR_VER=$([ -f /usr/local/go/bin/go ] && /usr/local/go/bin/go version)
TARGET_VER=go1.20

if [[ "$CUR_VER" != *"$TARGET_VER"* ]]; then
    [ -d "/usr/local/go" ] && rm -rf /usr/local/go
    curl -o /tmp/tune-bot/go.tar.gz -L https://go.dev/dl/go1.20.6.linux-amd64.tar.gz
    tar -C /usr/local -xzf /tmp/tune-bot/go.tar.gz
fi

# Update PATH to include Go binaries
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export GOPATH=~/go
export CGO_ENABLED=1

# Remove duplicate PATH entries
CLEAN_PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')
export PATH=${CLEAN_PATH::-1}

# Perform service-specific installations
bash infrastructure/database/install.sh
bash infrastructure/api/install.sh
bash infrastructure/discord/install.sh
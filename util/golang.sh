# !/bin/bash

# This is not currently in use, but may be used in the future to support Go v1.20

# This script will ensure that the latest version of Go and its binaries 
# are present on PATH before running anything with Go. This allows us to
# use Go without programatically modifying and potentially breaking the
# .profile file on whichever machine is running the services

apt update
apt upgrade -y
apt install -y curl
apt remove golang -y
apt autoremove -y

# Remove old Go versions and install Go v1.20
CUR_VER=$([ -f /usr/local/go/bin/go ] && /usr/local/go/bin/go version)
TARGET_VER=go1.20
if [[ "$CUR_VER" != *"$TARGET_VER"* ]]; then
    [ -d "/usr/local/go" ] && rm -rf /usr/local/go
    mkdir -p /tmp/tune-bot
    curl -o /tmp/tune-bot/go.tar.gz -L https://go.dev/dl/go1.20.6.linux-amd64.tar.gz
    tar -C /usr/local -xzf /tmp/tune-bot/go.tar.gz
fi

# Update environment variables
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export GOPATH=~/go
export CGO_ENABLED=1

# Remove duplicate PATH entries
CLEAN_PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')
export PATH=${CLEAN_PATH::-1}
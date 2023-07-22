# !/bin/bash

# This script will ensure that the Go binaries are present on PATH before running anything with Go
# This approach allows us to use Go without programatically modifying and potentially breaking the .profile
# file on whichever machine is running the services
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export GOPATH=~/go
export CGO_ENABLED=1

# Remove duplicate PATH entries
CLEAN_PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')
export PATH=${CLEAN_PATH::-1}
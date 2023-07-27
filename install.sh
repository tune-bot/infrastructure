#!/bin/bash

declare -a services=(api core bot)

# Install each service
for service in ${services[@]}
do
    rm -rf $service
    git clone https://github.com/tune-bot/$service.git
    bash $service/infrastructure/install.sh
done

# Clean up unneeded core files
rm -rf core

# Move the environment variables to their own directory
mkdir -p vars
for file in infrastructure/*.env; do
    mv $file vars/
done
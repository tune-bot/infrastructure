#!/bin/bash

declare -a services=(api database discord)

# Install each service
for service in ${services[@]}
do
    rm -rf $service
    git clone https://github.com/tune-bot/$service.git
    bash $service/install/install.sh
done

# Clean up unneeded database files
rm -rf database

# Move the environment variables to their own directory
mkdir -p vars
for file in infrastructure/*.env; do
    mv $file vars/
done
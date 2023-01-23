#!/bin/bash

apt update
apt upgrade -y
apt install -y golang

rm -rf api
git clone https://github.com/tune-bot/api.git

mkdir -p bin
echo "#!/bin/bash" > bin/api
echo "source infrastructure/database/vars.env" >> bin/api
echo "cd api && go run ." >> bin/api
chmod a+rx bin/api
apt update
apt upgrade -y
apt install -y golang

mkdir -p ~/tune-bot
cd ~/tunebot
rm -rf discord
git clone https://github.com/tune-bot/discord.git
cd discord
go run . &
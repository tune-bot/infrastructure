apt update
apt upgrade -y
apt install -y golang

mkdir -p ~/tune-bot
cd ~/tune-bot
rm -rf api
git clone https://github.com/tune-bot/api.git
cd api
go run . &
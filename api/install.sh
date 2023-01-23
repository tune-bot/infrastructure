apt update
apt upgrade -y
apt install -y golang

rm -rf api
git clone https://github.com/tune-bot/api.git
go run . &
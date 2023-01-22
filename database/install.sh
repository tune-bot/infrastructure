apt update
apt upgrade -y
apt install -y mysql-server

mkdir -p ~/tune-bot/bin
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o ~/tune-bot/bin/download
sudo chmod a+rx ~/tune-bot/bin/download
mkdir -p ~/tune-bot/library

source ~/tune-bot/infrastructure/database/vars.env
sed -i "s|DB_USER|$DB_USER|g" create.sql
sed -i "s|DB_PASS|$DB_PASS|g" create.sql
sed -i "s|DB_HOST|$DB_HOST|g" create.sql
sed -i "s|DB_USER|$DB_USER|g" delete.sql
sed -i "s|DB_PASS|$DB_PASS|g" delete.sql
sed -i "s|DB_HOST|$DB_HOST|g" delete.sql
mysql --defaults-extra-file=/etc/mysql/debian.cnf < create.sql
service mysql start &
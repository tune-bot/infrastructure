apt update
apt upgrade -y
apt install -y mysql-server

mkdir -p library
mkdir -p bin

curl -L https://yt-dl.org/downloads/latest/youtube-dl -o bin/download
chmod a+rx bin/download

source infrastructure/database/vars.env
sed -i "s|DB_USER|$DB_USER|g" infrastructure/database/create.sql
sed -i "s|DB_PASS|$DB_PASS|g" infrastructure/database/create.sql
sed -i "s|DB_HOST|$DB_HOST|g" infrastructure/database/create.sql
sed -i "s|DB_USER|$DB_USER|g" infrastructure/database/delete.sql
sed -i "s|DB_PASS|$DB_PASS|g" infrastructure/database/delete.sql
sed -i "s|DB_HOST|$DB_HOST|g" infrastructure/database/delete.sql
mysql --defaults-extra-file=/etc/mysql/debian.cnf < infrastructure/database/create.sql
service mysql start &
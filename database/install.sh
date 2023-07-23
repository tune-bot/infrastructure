#!/bin/bash

sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf

apt update
apt upgrade -y
apt install -y curl mysql-server python-is-python3

mkdir -p library
mkdir -p bin

curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o bin/download
chmod a+rx bin/download

bin/download -U

source infrastructure/database/vars.env
sed -i "s|DB_USER|$DB_USER|g" infrastructure/database/create.sql
sed -i "s|DB_PASS|$DB_PASS|g" infrastructure/database/create.sql
sed -i "s|DB_HOST|$DB_HOST|g" infrastructure/database/create.sql
sed -i "s|DB_USER|$DB_USER|g" infrastructure/database/delete.sql
sed -i "s|DB_PASS|$DB_PASS|g" infrastructure/database/delete.sql
sed -i "s|DB_HOST|$DB_HOST|g" infrastructure/database/delete.sql

service mysql start
mysql --defaults-extra-file=/etc/mysql/debian.cnf < infrastructure/database/create.sql
service mysql stop

echo "#!/bin/bash" > bin/database
echo "service mysql start" >> bin/database
chmod a+rx bin/database
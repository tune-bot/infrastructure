#apt update
#apt upgrade -y
#apt install -y mysql-server

pwd
mkdir -p library
mkdir -p bin
ls

#curl -L https://yt-dl.org/downloads/latest/youtube-dl -o bin/download
#chmod a+rx bin/download

#source database/vars.env
#sed -i "s|DB_USER|$DB_USER|g" create.sql
#sed -i "s|DB_PASS|$DB_PASS|g" create.sql
#sed -i "s|DB_HOST|$DB_HOST|g" create.sql
#sed -i "s|DB_USER|$DB_USER|g" delete.sql
#sed -i "s|DB_PASS|$DB_PASS|g" delete.sql
#sed -i "s|DB_HOST|$DB_HOST|g" delete.sql
#mysql --defaults-extra-file=/etc/mysql/debian.cnf < create.sql
#service mysql start &
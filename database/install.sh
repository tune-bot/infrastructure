apt update
apt upgrade -y
apt install -y mysql-server

source vars.env
sed -i "s|DB_USER|$DB_USER|g" create.sql
sed -i "s|DB_PASS|$DB_PASS|g" create.sql
sed -i "s|DB_HOST|$DB_HOST|g" create.sql
sed -i "s|DB_USER|$DB_USER|g" delete.sql
sed -i "s|DB_PASS|$DB_PASS|g" delete.sql
sed -i "s|DB_HOST|$DB_HOST|g" delete.sql
mysql --defaults-extra-file=/etc/mysql/debian.cnf < create.sql
service mysql start &

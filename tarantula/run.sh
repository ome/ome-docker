#!/bin/sh

CREATE_DB=n
if [ ! -d /data/mysql/mysql ]; then
	CREATE_DB=y
fi

/etc/init.d/mysqld start

if [ $CREATE_DB=y ]; then
echo 
cat << EOF | mysql
DELETE FROM mysql.user WHERE host NOT IN ('localhost', '127.0.0.1') OR user = '';
DELETE FROM mysql.db WHERE db LIKE 'test%';
-- Tarantula install will create a database, so just grant privileges
GRANT ALL ON tarantula.* TO 'tarantula'@'localhost' IDENTIFIED BY 'tarantula';
-- Tarantula install and runtime requires SUPER privilege
GRANT SUPER ON *.* TO 'tarantula'@'localhost';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root_password');
SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('root_password');
EOF
fi

mv /opt/tarantula/database.yml config/database.yml

echo -e "$URL\n$EMAIL\n$SMTP_HOST\n$SMTP_PORT\n$SMTP_DOMAIN" | \
	RAILS_ENV=production rake tarantula:install
/etc/init.d/mysqld stop

exec /usr/bin/supervisord "$@"

#!/bin/bash

# Setup and run omero

set -eux

git clone -b java-parameters https://github.com/jburel/omero-install.git /tmp/omero-install

# delete invalid files
rm -f /tmp/omero-install/linux/setup_centos_selinux.sh
touch /tmp/omero-install/linux/setup_centos_selinux.sh

mv /tmp/omero-install/linux/step03_all_postgres.sh /home/omero/_step03_all_postgres.sh
sed -i 's/source settings.env/source \/home\/omero\/settings.env/g' /home/omero/_step03_all_postgres.sh
sed -i '$apsql -h localhost -U "$OMERO_DB_USER" "$OMERO_DB_NAME" < /home/omero/OMERO.server/db.sql' /home/omero/_step03_all_postgres.sh

chown omero:omero /home/omero/_step03_all_postgres.sh
touch /tmp/omero-install/linux/step03_all_postgres.sh

# replace initdb and remove systemctl
sed -i.bak -re 's/(PGSETUP_INITDB_OPTIONS=.*)/#\1/' /tmp/omero-install/linux/step01_centos7_pg_deps.sh

sed -i.bak -re "/(PGSETUP_INITDB_OPTIONS.*-9\.4.*)/a\        su - postgres -c \"/usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/9.4/data --encoding=UTF8\"\n        echo \"listen_addresses=\'*\'\" >> /var/lib/pgsql/9.4/data/postgresql.conf" /tmp/omero-install/linux/step01_centos7_pg_deps.sh

sed -i.bak -re "/(PGSETUP_INITDB_OPTIONS.*-9\.5.*)/a\        su - postgres -c \"/usr/pgsql-9.5/bin/initdb -D /var/lib/pgsql/9.5/data --encoding=UTF8\"\n        echo \"listen_addresses=\'*\'\" >> /var/lib/pgsql/9.5/data/postgresql.conf" /tmp/omero-install/linux/step01_centos7_pg_deps.sh


sed -i.bak -re 's/(systemctl start.*)/#\1/' /tmp/omero-install/linux/step01_centos7_pg_deps.sh
sed -i.bak -re 's/(systemctl daemon-reload)/#\1/' /tmp/omero-install/linux/step01_centos7_pg_deps.sh


sed -i.bak -re 's/(systemctl start.*)/#\1/' /tmp/omero-install/linux/step05_centos7_nginx.sh

sed -i.bak -re 's/(systemctl daemon-reload)/#\1/' /tmp/omero-install/linux/step06_centos7_daemon.sh

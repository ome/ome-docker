#!/bin/bash

# Setup and run omero

set -eux

git clone -b java-parameters https://github.com/jburel/omero-install.git /tmp/omero-install

# delete invalid files
rm -f /tmp/omero-install/linux/setup_centos_selinux.sh
touch /tmp/omero-install/linux/setup_centos_selinux.sh

mv /tmp/omero-install/linux/step03_all_postgres.sh /home/omero/createdb.sh
sed -i 's/source settings.env/source \/home\/omero\/settings.env/g' /home/omero/createdb.sh
sed -i '$apsql -h localhost -U "$OMERO_DB_USER" "$OMERO_DB_NAME" < /home/omero/OMERO.server/db.sql' /home/omero/createdb.sh

chown omero:omero /home/omero/createdb.sh
touch /tmp/omero-install/linux/step03_all_postgres.sh

# remove systemctl lines
sed -i.bak -re 's/(systemctl.*)/ #\1/' /tmp/omero-install/linux/step05_centos7_nginx.sh

sed -i.bak -re 's/(systemctl daemon-reload)/ #\1/' /tmp/omero-install/linux/step06_centos7_daemon.sh

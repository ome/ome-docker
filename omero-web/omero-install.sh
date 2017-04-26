#!/bin/bash

# Setup and run omero

set -eux

git clone -b java-parameters https://github.com/jburel/omero-install.git /tmp/omero-install

# delete invalid files
rm -f /tmp/omero-install/linux/setup_centos_selinux.sh
touch /tmp/omero-install/linux/setup_centos_selinux.sh

# remove systemctl lines
sed -i.bak -re 's/(systemctl.*)/ #\1/' /tmp/omero-install/linux/step05_centos7_nginx.sh

sed -i.bak -re 's/(.*omero.service.*)/ #\1/' /tmp/omero-install/linux/step06_centos7_daemon.sh
sed -i.bak -re 's/(systemctl daemon-reload)/ #\1/' /tmp/omero-install/linux/step06_centos7_daemon.sh

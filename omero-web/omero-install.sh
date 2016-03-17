#!/bin/bash

# Setup and run omero

set -eux

git clone -b java-parameters https://github.com/aleksandra-tarkowska/omero-install.git /tmp/omero-install


mv /tmp/settings.env /tmp/omero-install/linux/settings.env
mv /tmp/step02_all_setup.sh /tmp/omero-install/linux/step02_all_setup.sh
mv /tmp/step03_all_postgres.sh /tmp/omero-install/linux/step03_all_postgres.sh
mv /tmp/step04_all_omero.sh /tmp/omero-install/linux/step04_all_omero.sh
mv /tmp/step05_centos7_nginx.sh /tmp/omero-install/linux/step05_centos7_nginx.sh
mv /tmp/step06_centos7_daemon.sh /tmp/omero-install/linux/step06_centos7_daemon.sh
mv /tmp/setup_centos_selinux.sh /tmp/omero-install/linux/setup_centos_selinux.sh


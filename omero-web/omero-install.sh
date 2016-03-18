#!/bin/bash

# Setup and run omero

set -eux

git clone -b java-parameters https://github.com/aleksandra-tarkowska/omero-install.git /tmp/omero-install

# delete invalid files
rm -f /tmp/omero-install/linux/setup_centos_selinux.sh
touch /tmp/omero-install/linux/setup_centos_selinux.sh

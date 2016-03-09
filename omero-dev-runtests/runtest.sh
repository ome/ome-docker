#!/bin/bash

# Setup and run omero

set -eux

set +o nounset
source ~omero/omero-virtualenv/bin/activate
set -o nounset

source /home/omero/settings.env

# update ice.config matching settings.env
sed -i "s/\(omero\.rootpass=\).*\$/\1$OMERO_ROOT_PASS/" /home/omero/OMERO.server/etc/ice.config
export ICE_CONFIG=/home/omero/OMERO.server/etc/ice.config

# /home/omero/omero-source/build.py -f components/tools/OmeroPy/build.xml integration
# /home/omero/omero-source/build.py -f components/tools/OmeroFS/build.xml integration
# /home/omero/omero-source/build.py -f components/tools/OmeroWeb/build.xml integration

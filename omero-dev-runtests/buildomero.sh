#!/bin/bash

# Setup and run omero

set -eux

virtualenv /home/omero/omero-virtualenv --system-site-packages

# Get pip to download and install requirements:

set +o nounset
source ~omero/omero-virtualenv/bin/activate
set -o nounset

pip install --upgrade pip
#pip install --upgrade 'Pillow<3.0'
pip install --upgrade omego


## download source

# from github curl -o ~omero/openmicroscopy_src.zip 
# URL=https://github.com/openmicroscopy/openmicroscopy/archive/develop.zip 
# OMERO_ZIP=`echo "$URL" | rev | cut -d / -f 1 | rev`
# OMERO_ZIP="${OMERO_ZIP%.*}"
# curl -o ~omero/$OMERO_ZIP.zip $URL && \
#     unzip -d /home/omero $OMERO_ZIP.zip 

# using omego
omego download --branch $OMERO_BRANCH openmicroscopy
OMERO_ZIP=`ls | grep openmicroscopy*.zip`
OMERO_ZIP="${OMERO_ZIP%.*}"



mv ~omero/$OMERO_ZIP ~omero/omero-source && rm $OMERO_ZIP.zip

/home/omero/omero-source/build.py clean
/home/omero/omero-source/build.py build-default test-compile

ln -s /home/omero/omero-source/dist /home/omero/OMERO.server

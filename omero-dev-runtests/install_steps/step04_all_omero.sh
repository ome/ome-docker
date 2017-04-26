#!/bin/bash

set -e -u -x


source settings.env

#start-install


if [ "$ARTEFACT" == "omego" ]; then

    virtualenv /home/omero/omero-virtualenv --system-site-packages

    set +o nounset
    source ~omero/omero-virtualenv/bin/activate
    set -o nounset

    pip install omego
    omego download --branch $OMERO_BRANCH openmicroscopy

    set +o nounset
    deactivate
    set -o nounset

else

    # from github
    #ARTEFACT=https://github.com/openmicroscopy/openmicroscopy/archive/develop.zip
    OMERO_ZIP=`echo "$ARTEFACT" | rev | cut -d / -f 1 | rev`
    OMERO_ZIP=openmicroscopy-$OMERO_ZIP
    curl -LkSs $URL -o ~omero/$OMERO_ZIP && ls -al && \
        unzip -d /home/omero $OMERO_ZIP

fi


OMERO_ZIP=`ls | grep openmicroscopy*.zip`
OMERO_ZIP="${OMERO_ZIP%.*}"


mv ~omero/$OMERO_ZIP ~omero/omero-source && rm $OMERO_ZIP.zip

/home/omero/omero-source/build.py clean
/home/omero/omero-source/build.py build-default test-compile

ln -s /home/omero/omero-source/dist /home/omero/OMERO.server


sudo mkdir -p "$OMERO_DATA_DIR"
sudo chown omero "$OMERO_DATA_DIR"

# load omero config
source /home/omero/omero.config.sh

/home/omero/OMERO.server/bin/omero db script -f OMERO.server/db.sql --password "$OMERO_ROOT_PASS"

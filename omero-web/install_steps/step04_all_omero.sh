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
    omego download python

    set +o nounset
    deactivate
    set -o nounset

    OMERO_ZIP=`ls | grep OMERO.py*.zip`
    OMERO_ZIP="${OMERO_ZIP%.*}"

else

    echo Downloading ${ARTEFACT}
    OMERO_ZIP=`echo "$ARTEFACT" | rev | cut -d / -f 1 | rev`
    OMERO_ZIP="${OMERO_ZIP%.*}"

    curl -o ~omero/$OMERO_ZIP.zip ${ARTEFACT} && \
        unzip -d /home/omero $OMERO_ZIP.zip 

fi

ln -s ~omero/$OMERO_ZIP ~omero/OMERO.server && \
rm $OMERO_ZIP.zip


# load omero config
/home/omero/OMERO.server/bin/omero load /home/omero/omeroweb.config

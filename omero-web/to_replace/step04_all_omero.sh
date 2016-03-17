#!/bin/bash

set -e -u -x


source settings.env

#start-install

if [ "$OMEROWEB" == "omego" ]; then

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

    echo Downloading ${OMEROWEB}
    OMERO_ZIP=`echo "$OMEROWEB" | rev | cut -d / -f 1 | rev`
    OMERO_ZIP="${OMERO_ZIP%.*}"

    curl -o ~omero/$OMERO_ZIP.zip ${1} && \
        unzip -d /home/omero $OMERO_ZIP.zip 

fi

ln -s ~omero/$OMERO_ZIP ~omero/OMERO.server && \
rm $OMERO_ZIP.zip


# load omero config
/home/omero/OMERO.server/bin/omero load /home/omero/omeroweb.config

OMERO.server/bin/omero config set omero.web.application_server wsgi-tcp
OMERO.server/bin/omero web config nginx > OMERO.server/nginx.conf.tmp

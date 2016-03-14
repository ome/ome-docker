#!/bin/bash

# Setup and run omero

set -eux

source /home/omero/settings.env

sudo mkdir -p "$OMERO_DATA_DIR"
sudo chown omero "$OMERO_DATA_DIR"

# load omero config
/home/omero/OMERO.server/bin/omero config set omero.data.dir "$OMERO_DATA_DIR"
/home/omero/OMERO.server/bin/omero config set omero.db.name "$OMERO_DB_NAME"
/home/omero/OMERO.server/bin/omero config set omero.db.user "$OMERO_DB_USER"
/home/omero/OMERO.server/bin/omero config set omero.db.pass "$OMERO_DB_PASS"

/home/omero/OMERO.server/bin/omero db script -f OMERO.server/db.sql --password "$OMERO_ROOT_PASS"

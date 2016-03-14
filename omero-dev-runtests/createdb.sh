#!/bin/bash

# Setup and run omero

set -eux


source /home/omero/settings.env

# Create a database user and initialize a new database for OMERO:
echo "CREATE USER $OMERO_DB_USER PASSWORD '$OMERO_DB_PASS'" | su - postgres -c psql
su - postgres -c "createdb -E UTF8 -O '$OMERO_DB_USER' '$OMERO_DB_NAME'"
psql -P pager=off -h localhost -U "$OMERO_DB_USER" -l

psql -h localhost -U "$OMERO_DB_USER" "$OMERO_DB_NAME" < /home/omero/OMERO.server/db.sql

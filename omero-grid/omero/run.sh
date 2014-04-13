#!/bin/bash

env

export HOME=/home/omero
cd $HOME
omero=$HOME/OMERO.server/bin/omero

export PGPASSWORD=omero
psql -w -h $DB_PORT_5432_TCP_ADDR -Uomero -c "select * from dbpatch" 2> /dev/null || {
    echo "Initialising database"
    $omero db script -f omero.sql "" "" omero
    psql -w -h $DB_PORT_5432_TCP_ADDR -Uomero -f omero.sql
}

$omero config set omero.db.host $DB_PORT_5432_TCP_ADDR
$omero config set omero.data.dir $OMERODATA
$omero admin start

# We need a command that won't exit to keep the container running
tail -F $HOME/OMERO.server/var/log/Blitz-0.log

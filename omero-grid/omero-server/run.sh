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

MASTER_IP=$(ip addr show eth0 | sed -nre 's/.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/p')

sed -i -e "s/%MASTER_IP%/$MASTER_IP/" $HOME/OMERO.server/etc/internal.cfg $HOME/OMERO.server/etc/master.cfg 

$omero config set omero.db.host $DB_PORT_5432_TCP_ADDR
$omero config set omero.data.dir $OMERODATA
$omero admin start

# We need a command that won't exit to keep the container running
tail -F $HOME/OMERO.server/var/log/Blitz-0.log

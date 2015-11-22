#!/bin/bash

set -eu

TARGET=$1

OMERO_SERVER=/home/omero/OMERO.server
omero=$OMERO_SERVER/bin/omero

if [ "$TARGET" = master ]; then
    DBHOST=$DB_PORT_5432_TCP_ADDR
    DBUSER=${DBUSER:-omero}
    DBNAME=${DBNAME:-omero}
    DBPASS=${DBPASS:-omero}
    MASTER_IP=$(hostname -I)

    export PGPASSWORD="$DBPASS"
    psql -w -h $DBHOST -U$DBUSER $DBNAME -c \
        "select * from dbpatch" 2> /dev/null && {
        echo "Upgrading database"
        DBCMD=upgrade
    } || {
        echo "Initialising database"
        DBCMD=init
    }
    omego db $DBCMD --dbhost "$DBHOST" --dbuser "$DBUSER" --dbname "$DBNAME" \
        --dbpass "$DBPASS" --serverdir=OMERO.server

    $omero config set omero.db.host "$DBHOST"
    $omero config set omero.db.user "$DBUSER"
    $omero config set omero.db.name "$DBNAME"
    $omero config set omero.db.pass "$DBPASS"

    $omero config set Ice.Default.Host "$MASTER_IP"

    exec $omero admin start --foreground
fi

if [ "$TARGET" = slave ]; then
    MASTER_IP=$MASTER_PORT_4061_TCP_ADDR
    SLAVE_IP=$(hostname -I)

    $omero config set Ice.Default.Host "$MASTER_IP"

    # TODO: `omero node start` doesn't rewrite the config
    $omero admin rewrite
    sed -i "s/@omero.slave.host@/$SLAVE_IP/" OMERO.server/etc/slave.cfg
    grep '^Ice.Default.Router=' OMERO.server/etc/ice.config || \
        echo Ice.Default.Router= >> OMERO.server/etc/ice.config
    sed -i -r "s|^(Ice.Default.Router=).*|\1OMERO.Glacier2/router:tcp -p 4063 -h $MASTER_IP|" \
        OMERO.server/etc/ice.config

    # TODO: `omero node start` doesn't support --foreground
    #exec $omero node slave start
    cd $OMERO_SERVER
    mkdir -p var/log var/slave
    exec icegridnode --Ice.Config=$OMERO_SERVER/etc/internal.cfg,$OMERO_SERVER/etc/slave.cfg \
        --nochdir
fi

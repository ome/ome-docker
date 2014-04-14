#!/bin/bash

env

export HOME=/home/omero
cd $HOME
omero=$HOME/OMERO.server/bin/omero

su -l - omero -c "$omero config set omero.web.server_list \
    '[[\"$MASTER_PORT_4064_TCP_ADDR\", 4064, \"omero\"]]'"
su -l - omero -c "$omero web start"
nginx -c /home/omero/nginx.conf

# We need a command that won't exit to keep the container running
tail -F $HOME/OMERO.server/var/log/OMEROweb.log

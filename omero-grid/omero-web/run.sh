#!/bin/bash

set -eu

omero=/home/omero/OMERO.py/bin/omero

MASTER_IP=$MASTER_PORT_4064_TCP_ADDR
$omero config set omero.web.server_list "[[\"$MASTER_IP\", 4064, \"omero\"]]"

$omero web start
exec nginx -c /etc/nginx/nginx.conf

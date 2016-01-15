#!/bin/bash

set -eu

omero=/home/omero/OMERO.server/bin/omero

MASTER_ADDR=${MASTER_ADDR:-}
if [ -z "$MASTER_ADDR" ]; then
    MASTER_ADDR=${MASTER_PORT_4064_TCP_ADDR:-}
fi
if [ -n "$MASTER_ADDR" ]; then
    $omero config set omero.web.server_list "[[\"$MASTER_ADDR\", 4064, \"omero\"]]"
else
    echo "WARNING: Master address not found"
    # Assume it'll be set in /config/*
fi

if stat -t /config/* > /dev/null 2>&1; then
    for f in /config/*; do
        echo "Loading $f"
        $omero load "$f"
    done
fi

mkdir -p /home/omero/nginx/cache /home/omero/nginx/log /home/omero/nginx/temp
NGINX_OMERO=/etc/nginx/conf.d/omero-web.conf
if [ ! -f $NGINX_OMERO ]; then
    echo "Creating $NGINX_OMERO"
    $omero web config --http 8080 nginx > $NGINX_OMERO
fi

echo "Starting OMERO.web"
$omero web start
echo "Starting nginx"
exec nginx -g "daemon off;" -c /etc/nginx/nginx.conf

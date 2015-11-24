#!/bin/bash

set -eu

omero=/home/omero/OMERO.py/bin/omero

MASTER_IP=${MASTER_PORT_4064_TCP_ADDR:-}
if [ -n "$MASTER_IP" ]; then
    $omero config set omero.web.server_list \
        "[[\"$MASTER_IP\", 4064, \"omero\"]]"
else
    echo "WARNING: Master IP not found"
fi

if stat -t /config/* > /dev/null 2>&1; then
    for f in /config/*; do
        echo "Loading $f"
        $omero load "$f"
    done
fi

NGINX_OMERO=/etc/nginx/conf.d/omero-web.conf
if [ ! -f $NGINX_OMERO ]; then
    echo "Creating $NGINX_OMERO"
    $omero web config --http 8080 nginx > $NGINX_OMERO
fi

echo "Starting OMERO.web"
$omero web start
echo "Starting nginx"
exec nginx -c /etc/nginx/nginx.conf

#!/bin/sh

set -e

if [ -n "$OMERO_PASSWORD" ]; then
	echo "Setting omero password"
	echo "omero:$OMERO_PASSWORD" | chpasswd
	OMEGO_ARGS="--rootpass \"$OMERO_PASSWORD\""
fi

if [ $# -gt 0 -a -n "$*" ]; then
	OMEGO_ARGS="$OMEGO_ARGS $@"
else
	mv /etc/supervisor/conf.d/omero.conf /etc/supervisor/conf.d/omero.disabled
fi
export OMEGO_ARGS

mkdir -p /data/supervisor
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

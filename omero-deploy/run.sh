#!/bin/sh

set -e

if [ -n "$SYSTEM_PASSWORD" ]; then
	echo "Setting omero system password"
	echo "omero:$SYSTEM_PASSWORD" | chpasswd
fi

if [ -n "$OMERO_PASSWORD" ]; then
	echo "Overriding omero root password"
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

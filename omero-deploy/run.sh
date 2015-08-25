#!/bin/sh

set -e

if [ $# -gt 0 -a -n "$*" ]; then
	OMEGO_ARGS="$@"
	export OMEGO_ARGS
else
	mv /etc/supervisor/conf.d/omero.conf /etc/supervisor/conf.d/omero.disabled
fi

mkdir -p /data/supervisor
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

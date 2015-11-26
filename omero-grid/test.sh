#!/bin/bash

set -e
set -u
set -x

cd omero-grid

cleanup() {
    docker rm -f postgres # In case other tests use the name
}

trap cleanup ERR EXIT

# From the README
./build.py omero-grid
./build.py omero-grid-web
docker run -d --name postgres -e POSTGRES_PASSWORD=postgres postgres
docker run -d --name omero-master --link postgres:db -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres openmicroscopy/omero-grid master
# TBD: this doesn't yet check that they all come up.

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
docker build -t omero-grid omero
docker build -t omero-grid-web omero-web
docker run -d --name postgres -e POSTGRES_PASSWORD=postgres postgres
docker run -d --name omero-master --link postgres:db -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres omero-grid master
docker run -d --name omero-web --link omero-master:master omero-grid-web
# TBD: this doesn't yet check that they all come up.

#!/bin/bash

set -e
set -u
set -x

PREFIX=omero-grid-test
IMAGE=omero-grid:$PREFIX
IMAGEWEB=omero-grid-web:$PREFIX
#BUILD="--release OMERO-DEV-merge-build"
BUILD=

#CLEAN=n
CLEAN=y

cleanup() {
    docker rm -f $PREFIX-db $PREFIX-master $PREFIX-web
}

if [ "$CLEAN" = y ]; then
    trap cleanup ERR EXIT
fi

cleanup || true

# From the README
./build.py --tag $IMAGE $BUILD omero-grid
./build.py --tag $IMAGEWEB $BUILD omero-grid-web
docker run -d --name $PREFIX-db -e POSTGRES_PASSWORD=postgres postgres
docker run -d --name $PREFIX-master --link $PREFIX-db:db -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres $IMAGE master
docker run -d --name $PREFIX-web --link $PREFIX-master:master -P $IMAGEWEB

echo "Exposed web port:"
docker port $PREFIX-web

# TBD: this doesn't yet check that they all come up.

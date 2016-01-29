#!/bin/bash

set -e
set -u
set -x

PREFIX=omero-grid-test
IMAGE=omero-grid:$PREFIX
IMAGEWEB=omero-grid-web:$PREFIX
BUILD=${BUILD:-}
CLEAN=${CLEAN:-y}

# Script must be run from omero-grid/
cd "$(dirname $0)"

cleanup() {
    docker rm -f -v $PREFIX-db $PREFIX-master $PREFIX-slave-1 $PREFIX-web
}

if [ "$CLEAN" = y ]; then
    trap cleanup ERR EXIT
fi

cleanup || true

# From the README
./build.py --tag $IMAGE $BUILD omero-grid
./build.py --tag $IMAGEWEB $BUILD omero-grid-web
docker run -d --name $PREFIX-db -e POSTGRES_PASSWORD=postgres postgres
docker run -d --name $PREFIX-master --link $PREFIX-db:db \
    -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres $IMAGE master \
    master:Blitz-0,Indexer-0,DropBox,MonitorServer,FileServer,Storm,PixelData-0,Tables-0 \
    slave-1:Processor-0

docker run -d --name $PREFIX-slave-1 --link $PREFIX-master:master $IMAGE slave-1
docker run -d --name $PREFIX-web --link $PREFIX-master:master -P $IMAGEWEB

echo "Exposed web port:"
docker port $PREFIX-web

# Smoke tests

export OMERO_USER=root
export OMERO_PASS=omero
export PREFIX

# Login to web
bash test_login.sh
# Now that we know the server is up, test Dropbox
bash test_dropbox.sh
# And Processor (slave-1)
bash test_processor.sh

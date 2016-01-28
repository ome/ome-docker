#!/bin/bash

set -e
set -u
set -x

# Must be exported by the caller:
# OMERO_USER OMERO_PASS PREFIX

DSNAME=$(date +%Y%m%d-%H%M%S-%N)
FILENAME=$(date +%Y%m%d-%H%M%S-%N).fake
SCRIPT=/omero/util_scripts/Dataset_To_Plate.py

dataset_id=$(docker exec $PREFIX-master OMERO.server/bin/omero obj -q -s localhost -u $OMERO_USER -w $OMERO_PASS new Dataset name=$DSNAME | cut -d: -f2)

docker exec $PREFIX-master sh -c \
    "touch $FILENAME && OMERO.server/bin/omero import -d $dataset_id $FILENAME"

docker exec $PREFIX-master OMERO.server/bin/omero script launch $SCRIPT \
    IDs=$dataset_id
echo "Completed with code $?"

result=$(docker exec $PREFIX-master OMERO.server/bin/omero hql -q -s localhost -u $OMERO_USER -w $OMERO_PASS "SELECT COUNT(w) FROM WellSample w WHERE w.well.plate.name='$DSNAME' AND w.image.name='$FILENAME'" --style plain)
if [ "$result" != "0,1" ]; then
    echo "Script failed: $result"
    exit 2
fi

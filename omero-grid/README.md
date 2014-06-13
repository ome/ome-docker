OMERO.grid Docker
=================

This is an example of using OMERO on multiple nodes (running the Processor service on a separate node from the main OMERO.server), based on
http://www.openmicroscopy.org/site/support/omero5/sysadmins/grid.html#nodes-on-multiple-hosts

This is a work in progress, for instance data is not stored on persistant volumes.

To build the Docker images:

    ./build.sh

To run the Docker images

    ./run.sh

To delete the runtime images

    ./cleanup.sh

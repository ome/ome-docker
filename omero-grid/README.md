OMERO.grid Docker
=================

This is an example of using OMERO on multiple nodes (running the Processor service on a separate node from the main OMERO.server), based on
http://www.openmicroscopy.org/site/support/omero5/sysadmins/grid.html#nodes-on-multiple-hosts

This is a work in progress, for instance data is not stored on persistant volumes.



To build the Docker images:

    docker build -t omero-grid-omero omero

To run the Docker images start a postgres DB, an OMERO master and OMERO slave
TODO: The slave is currently broken

    docker run -it --rm --name postgres -e POSTGRES_PASSWORD=postgres postgres
    docker run -it --rm --link postgres:db -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres --name omero-master omero-grid-omero ./run.sh master
    docker run -it --rm --link omero-master:master omero-grid-omero ./run.sh slave

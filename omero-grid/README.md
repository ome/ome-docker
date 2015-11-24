OMERO.grid Docker
=================

This is an example of using OMERO on multiple nodes (such as running the Processor service on a separate node from the main OMERO.server), based on
http://www.openmicroscopy.org/site/support/omero5/sysadmins/grid.html#nodes-on-multiple-hosts

To build the Docker images:

    docker build -t omero-grid omero
    docker build -t omero-grid-web omero-web

To run the Docker images start a postgres DB:

    docker run -it --rm --name postgres -e POSTGRES_PASSWORD=postgres postgres

Then either run a single all-in-one master:

    docker run -it --rm --link postgres:db -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres --name omero-master omero-grid master

Or run a master and one or more slaves, the configuration must be provided to the master node.
For example, to run two Processors on separate slaves and all other servers on master:

    docker run -it --rm --link postgres:db -e DBUSER=postgres -e DBPASS=postgres -e DBNAME=postgres --name omero-master omero-grid master master:Blitz-0,Indexer-0,DropBox,MonitorServer,FileServer,Storm,PixelData-0,Tables-0,TestDropBox slave-1:Processor-0 slave-2:Processor-1
    docker run -it --rm --link omero-master:master omero-grid slave-1
    docker run -it --rm --link omero-master:master omero-grid slave-2

Finally run the web client:

    docker run -it --rm --link omero-master:master omero-grid-web


omero-deploy
============

An all-in-one image (including postgres and nginx) for testing OMERO.server. This is not recommended for production use.

To download, install and run the default server:

    docker run -d -p 80:8080 -p 4063:4063 -p 4064:4064 omero-server-prereq

[omego](https://github.com/ome/omego/) is used to download and install the server when the image is started. Command arguments are appended to the `omego` command line. For example, the URL to an alternative OMERO.server zip can be passed:

    docker run -d -P omero-server-prereq https://downloads.openmicroscopy.org/omero/5.1.0/artifacts/OMERO.server-5.1.0-ice35-b40.zip

A server can also be obtained from the OME's continuous integration server:

    docker run -d omero-server-prereq --branch OMERO-5.1-merge-build

Pass `""` to disable the automatic server installation. This will start all the required services so the server can be installed manually:

    CID=$(docker run -d omero-server-prereq "")
    docker exec $CID /omero-setup https://downloads.openmicroscopy.org/omero/5.1.1/artifacts/OMERO.server-5.1.1-ice35-b43.zip

Note: to assist with testing and debugging the image includes:
- ssh
- password-less sudo for the `omero` user
- An exposed PostgreSQL server port

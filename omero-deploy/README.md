omero-deploy
============

An all-in-one image (including postgres and nginx) for testing OMERO.server. This is not recommended for production use.

To download, install and run the default server:

    docker run -d -p 80:8080 -p 4063:4063 -p 4064:4064 omero-deploy

[omego](https://github.com/ome/omego/) is used to download and install the server when the image is started. Command arguments are appended to the `omego` command line. For example, the URL to an alternative OMERO.server zip can be passed:

    docker run -d omero-deploy https://downloads.openmicroscopy.org/omero/5.1.0/artifacts/OMERO.server-5.1.0-ice35-b40.zip

A server can also be obtained from the OME's continuous integration server:

    docker run -d omero-deploy --branch OMERO-5.1-merge-build

Pass `""` to disable the automatic server installation. This will start all the required services so the server can be installed manually:

    CID=$(docker run -d omero-deploy "")
    docker exec $CID /omero-setup https://downloads.openmicroscopy.org/omero/5.1.1/artifacts/OMERO.server-5.1.1-ice35-b43.zip


Data volumes
------------

`/data` is defined as a volume. The following directories may be used or created:
- `/data/OMERO`: OMERO data directory
- `/data/postgresql`: PostgreSQL data directory
- `/data/supervisor`: Supervisord logs
- `/data/omero.preload`: Optional scripts to be passed to `bin/omero load ...` before starting the server


Notes
-----

This image is designed for testing and debugging OMERO, and includes:
- ssh
- password-less sudo for the `omero` user
- An exposed PostgreSQL server port

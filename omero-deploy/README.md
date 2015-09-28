omero-deploy
============

An all-in-one image (including postgres and nginx) for testing OMERO.server. This is not recommended for production use.

To download, install and run the default server:

    docker run -d -p 80:8080 -p 4063:4063 -p 4064:4064 omero-deploy

[omego](https://github.com/ome/omego/) is used to download and install the server when the image is started (defaults to the latest release). Command arguments are appended to the `omego` command line. For example, an alternative release, a CI build, or the URL to an alternative OMERO.server zip, can be passed:

    docker run -d omero-deploy --release 5.1.4
    docker run -d omero-deploy --branch OMERO-DEV-merge-build
    docker run -d omero-deploy https://download.example.org/OMERO.server-X.zip

Pass `""` to disable the automatic server installation. This will start all the required services so the server can be installed manually:

    CID=$(docker run -d omero-deploy "")
    docker exec $CID /omero-setup --release latest


Passwords
---------

Define the following environment variables to set the initial passwords:
- `OMERO_PASSWORD`: OMERO.server root password (default `omero`, ignored if an existing OMERO database is being used)
- `SYSTEM_PASSWORD`: The omero user system password (default unset, must be set to allow ssh login)

Example:

    docker run -d -e SYSTEM_PASSWORD=abc -e OMERO_PASSWORD=def omero-deploy


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

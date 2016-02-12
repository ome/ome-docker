OMERO.web
=========

Docker image for testing OMERO.web on CentOS 7 with systemd.

Build

    build -t omeroweb-deploy --build-arg ZIPURL=https://path.to.omeropy

Run

    docker run -ti --rm -p 8888:80 -p 2222:22 --name omeroweb omeroweb-deploy

On Mac OS X:

    docker run --privileged -ti --rm -p 8888:80 -p 2222:22 --name omeroweb omeroweb-deploy

The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights. OMERO.web is automatically started via systemd.

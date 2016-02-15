OMERO.web
=========

Docker image for testing OMERO.web on CentOS 7 with systemd.

Alter omero config in omeroweb.config as needed

1. Build:

    build -t omeroweb-deploy --build-arg ZIPURL=https://path.to.omeropy.zip .


2. Run on Linux:

        docker run -ti --rm -p 8080:80 -p 2222:22 --name omeroweb omeroweb-deploy

    Web should be running on http://localhost:8080


3. On Mac OS X:

        docker run --privileged -ti --rm -p 8080:80 -p 2222:22 --name omeroweb omeroweb-deploy

    If you are using VirtualBox add port forwarding 8081 -> 8080

    Web should be running on http://localhost:8081


The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights. OMERO.web is automatically started via systemd.

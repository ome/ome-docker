OMERO.server
=========

Docker image for testing OMERO.server build from source on CentOS 7.

1. Alter omero config in settings.env as needed.

2. Add tests to runtest.sh

3. Build:

        docker build -rm -t omerotest .

    with custom zip:

4. To run on Linux see https://github.com/ome/ome-docker/tree/master/omero-ssh-systemd

5. To run on Mac OS X:

        docker run --privileged -ti --rm -p 44064:4064 -p 44063:4063 -p 2222:22 --name omerotest omerotest

6. To run tests within a docker container:

        ./runtest.sh

The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights. OMERO.server is automatically started via systemd. Run ./runtest.sh

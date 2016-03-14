OMERO.server
=========

Docker image for testing OMERO.server build from source on CentOS 7.

1. Alter omero config in settings.env as needed.

2. Add tests to runtest.sh

3. Build:

        docker build -t omerotest .

    with custom branch:

        docker build -t omerotest --build-arg OMERO_BRANCH=JENKINS_BRANCH .

    see `omego download --help` Jenkins arguments: `--branch BRANCH` for more details.

4. To run on Linux see https://github.com/ome/ome-docker/tree/master/omero-ssh-systemd

5. To run on Mac OS X:

        docker run --privileged -ti --rm -p 2222:22 --name omerotest omerotest

    NOTE: you cannot forward port 4064/4063 to a different number, you have to explicitly tell omero to listen on e.g. 14064

6. To run tests within a docker container:

    Make sure server is runing and fully initialized.

        ./runtest.sh

The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights. OMERO.server is automatically started via systemd. Run ./runtest.sh

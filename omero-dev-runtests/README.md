OMERO.server
=========

Docker image for testing OMERO.server build from source on CentOS 7.

1. Alter omero config in settings.env as needed.

2. Add tests to runtest.sh

3. Build:

        docker build -t omerodevtest .

    with custom branch:

        docker build -t omerodevtest --build-arg OMERO_BRANCH=JENKINS_BRANCH .

    see `omego download --help` Jenkins arguments: `--branch BRANCH` for more details.

    with custom zip from github:

        docker build -t omerodevtest --build-arg ARTEFACT=https://github.com/openmicroscopy/openmicroscopy/archive/develop.zip .

    other custom --build-arg:

        - custom PostgreSQL PGVER={pg94|pg95}
        - custom ZeroC Ice ICEVER=ice35-devel
        - custom Java JAVAVER={openjdk18-devel|openjdk17-devel}

4. To run on Linux see https://github.com/ome/ome-docker/tree/master/omero-ssh-systemd

5. To run on Mac OS X:

        docker run --privileged -ti --rm -p 8080:80 -p 2222:22 --name omerodevtest omerodevtest

    NOTE: you cannot forward port 4064/4063 to a different number, you have to explicitly tell omero to listen on e.g. 14064

6. To run tests within a docker container:

    Make sure server is runing and fully initialized.

        ./runtest.sh

7. OMERO.web

        curl -I http://$(docker-machine ip dev):8080/webclient

    If you are using VirtualBox add port forwarding 8081 -> 8080

        curl -I http://localhost:8081/webclient


The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights. OMERO.server is automatically started via systemd. Run ./runtest.sh

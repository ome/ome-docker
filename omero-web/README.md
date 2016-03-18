OMERO.web
=========

Docker image for testing OMERO.web on CentOS 7 with systemd.

Alter omero config in omeroweb.config as needed

1. Build:

        docker build --rm -t omeroweb-deploy .

    with custom zip:

        docker build -t omeroweb-deploy --build-arg ARTEFACT=https://path.to.omeropy.zip .

2. To run on Linux see https://github.com/ome/ome-docker/tree/master/omero-ssh-systemd

3. To run on Mac OS X:

        docker run --privileged -ti --rm -p 8080:80 -p 2222:22 --name omeroweb omeroweb-deploy

4. Test:

        curl -I http://$(docker-machine ip dev):8080/webclient

    If you are using VirtualBox add port forwarding 8081 -> 8080

        curl -I http://localhost:8081/webclient


The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights. OMERO.web is automatically started via systemd.

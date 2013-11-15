FROM ubuntu:12.04

ADD . /tmp/docker/
RUN /tmp/docker/install-omero.sh
RUN rm -fr /tmp/docker

EXPOSE 4063:4063 4064:4064

CMD su - omero -c /home/omero/OMERO.server/bin/omero

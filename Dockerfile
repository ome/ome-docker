FROM ubuntu:12.04

EXPOSE 4063:4063
EXPOSE 4064:4064

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >>/etc/apt/sources.list
ADD . /tmp/
RUN sh -eu /tmp/install.sh

CMD ["sh", "-c", "/etc/init.d/postgresql start && echo 127.0.0.1 `hostname` >>/etc/hosts && su - omero -c '/home/omero/OMERO.server/bin/omero admin start' && tail -f /home/omero/OMERO.server/var/log/Blitz-0.log"]

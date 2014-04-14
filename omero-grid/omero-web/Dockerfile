FROM manics/omero-grid-omero
MAINTAINER Simon Li "spli@dundee.ac.uk"

USER root

RUN yum -y install nginx

RUN su -l - omero -c "/home/omero/OMERO.server/bin/omero web config --http 80 nginx" > \
    /home/omero/nginx.conf

RUN chmod a+rx /home/omero

ADD run.sh /home/omero/

# nginx needs to be started as root
#USER omero

EXPOSE 80

# Set the default command to run when starting the container
CMD ["/bin/bash", "-e", "/home/omero/run.sh"]

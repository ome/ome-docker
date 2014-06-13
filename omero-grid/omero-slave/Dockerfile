FROM manics/omero-grid-omero
MAINTAINER Simon Li "spli@dundee.ac.uk"

ADD config/ice.config /home/omero/OMERO.server/etc/
ADD config/internal.cfg /home/omero/OMERO.server/etc/
ADD config/omero-slave.cfg /home/omero/OMERO.server/etc/

ADD run.sh /home/omero/

USER omero

EXPOSE 4063 4064

# Set the default command to run when starting the container
CMD ["/bin/bash", "-e", "/home/omero/run.sh"]

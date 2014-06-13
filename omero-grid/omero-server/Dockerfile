FROM manics/omero-grid-omero
MAINTAINER Simon Li "spli@dundee.ac.uk"

ADD config/default.xml /home/omero/OMERO.server/etc/grid/
ADD config/internal.cfg /home/omero/OMERO.server/etc/
ADD config/master.cfg /home/omero/OMERO.server/etc/

ADD run.sh /home/omero/

USER omero

EXPOSE 4061 4063 4064

# Set the default command to run when starting the container
CMD ["/bin/bash", "-e", "/home/omero/run.sh"]

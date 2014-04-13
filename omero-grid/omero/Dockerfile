FROM mattdm/fedora-small
MAINTAINER Simon Li "spli@dundee.ac.uk"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-*-x86_64
RUN yum -y install unzip java-1.8.0-openjdk ice ice-python ice-java postgresql

# Optional dependencies
RUN yum -y install python-tables python-pillow python-matplotlib numpy scipy

ENV OMERODATA /OMERO

RUN useradd omero

ADD http://downloads.openmicroscopy.org/omero/5.0.1/artifacts/OMERO.server-5.0.1-ice35-b21.zip /home/omero/
#ADD OMERO.server-5.0.1-ice35-b21.zip /home/omero/
RUN chmod a+r /home/omero/OMERO.server-5.0.1-ice35-b21.zip
RUN su -l - omero -c "cd /home/omero && \
    unzip OMERO.server-5.0.1-ice35-b21.zip && \
    ln -s OMERO.server-5.0.1-ice35-b21 OMERO.server"

RUN mkdir $OMERODATA
RUN chown omero:omero $OMERODATA

ADD run.sh /home/omero/

USER omero

EXPOSE 4063 4064

# Add VOLUME to allow backup of data
VOLUME ["$OMERODATA"]

# Set the default command to run when starting the container
CMD ["/bin/bash", "-e", "/home/omero/run.sh"]

FROM centos:centos7
MAINTAINER Simon Li "spli@dundee.ac.uk"

ENV OMERO_VERSION 5.2.0

RUN yum -y install epel-release && \
    curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
        http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo && \
    yum -y install \
        unzip wget patch \
        java-1.8.0-openjdk \
        ice ice-python ice-servers \
        python-pip \
        numpy scipy python-matplotlib python-pillow python-tables \
        postgresql && \
    yum clean all

RUN pip install 'Django<1.9' omego

RUN useradd omero && \
    mkdir /OMERO && \
    chown omero /OMERO

USER omero
WORKDIR /home/omero
RUN omego download server --release $OMERO_VERSION && \
    rm OMERO.server-*.zip && \
    ln -s OMERO.server-*/ OMERO.server

ADD etc-templates.patch run.sh /home/omero/
RUN cd OMERO.server && \
    patch -p0 < ../etc-templates.patch

USER root

EXPOSE 4061 4063 4064

VOLUME ["/OMERO"]

# Set the default command to run when starting the container
#CMD ["/bin/bash", "-e", "/home/omero/run.sh"]

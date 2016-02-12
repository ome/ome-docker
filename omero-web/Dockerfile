FROM openmicroscopy/omero-ssh-systemd
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

# OMERO.py prerequesties
RUN yum install -y epel-release && \
    yum clean all

RUN yum install -y unzip && \
    yum clean all

RUN yum install -y \
    python-pip python-devel python-virtualenv \
    numpy scipy python-matplotlib python-tables && \
    yum clean all
  
RUN curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
    http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo

RUN yum install -y ice ice-python ice-servers && \
    yum clean all

# install Pillow via pip
RUN yum install -y \
    zlib-devel \
    libjpeg-devel \
    gcc && \
    yum clean all

RUN yum install -y nginx && \
    yum clean all

RUN sed -i.bak -re 's/( default_server.*)/; #\1/' /etc/nginx/nginx.conf
ADD ./omeroweb.sh /home/omero/omeroweb.sh
RUN chown omero:omero /home/omero/omeroweb.sh
RUN chmod +x /home/omero/omeroweb.sh
RUN chmod a+X /home/omero

ADD ./omeroweb.service /etc/systemd/system/omeroweb.service
RUN ln -s /etc/systemd/system/omeroweb.service /etc/systemd/system/multi-user.target.wants/omeroweb.service

EXPOSE 80

# AS OMERO user
USER omero
ENV HOME /home/omero
WORKDIR /home/omero

RUN ./omeroweb.sh https://ci.openmicroscopy.org/job/OMERO-DEV-merge-build/ICE=3.5,jdk=8_LATEST,label=octopus/lastSuccessfulBuild/artifact/src/target/OMERO.py-5.2.1-534-6ee6dde-ice35-b233.zip

USER root

#ENTRYPOINT bash

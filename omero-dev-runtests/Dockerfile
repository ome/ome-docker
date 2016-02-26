FROM openmicroscopy/omero-ssh-systemd
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -re 's/Defaults\s+requiretty.*//' /etc/sudoers

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

RUN yum install -y java-1.8.0-openjdk-devel \
    yum clean all

RUN yum install -y ice ice-python-devel ice-java-devel ice-servers && \
    yum clean all

RUN yum install -y git \
    zlib-devel \
    libjpeg-devel \
    gcc && \
    yum clean all

RUN yum -y install \
    http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm \
    yum clean all

# Install Postgres Version 9.4

RUN yum -y install postgresql94-server postgresql94 \
    yum clean all

# Add postgres to systemd
ADD ./postgresql.service /etc/systemd/system/postgresql.service
RUN ln -s /etc/systemd/system/postgresql.service /etc/systemd/system/multi-user.target.wants/postgresql.service

ADD ./settings.env /home/omero/settings.env
RUN chmod +x /home/omero/settings.env
RUN chown omero:omero /home/omero/settings.env


ADD ./buildomero.sh /home/omero/buildomero.sh
RUN chown omero:omero /home/omero/buildomero.sh
RUN chmod +x /home/omero/buildomero.sh


RUN chmod a+X /home/omero


# AS OMERO user
USER omero
ENV HOME /home/omero
WORKDIR /home/omero

# build from source
RUN ./buildomero.sh


USER root
# Add omero to systemd
ADD ./omero.service /etc/systemd/system/omero.service
RUN ln -s /etc/systemd/system/omero.service /etc/systemd/system/multi-user.target.wants/omero.service


USER postgres
# configure postgress
RUN /usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/data --encoding=UTF8
RUN echo "host    all             all             127.0.0.1/32            trust" >> /var/lib/pgsql/data/pg_hba.conf
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf


USER root
# create Database
ADD ./createdb.sh /home/omero/createdb.sh
RUN chmod +x /home/omero/createdb.sh
RUN chown omero:omero /home/omero/createdb.sh

RUN su - postgres -c "/usr/pgsql-9.4/bin/pg_ctl start -D /var/lib/pgsql/data" && sleep 1 \
    && sh /home/omero/createdb.sh


ADD ./runtest.sh /home/omero/runtest.sh
RUN chown omero:omero /home/omero/runtest.sh
RUN chmod +x /home/omero/runtest.sh


EXPOSE 4064
EXPOSE 4063

#ENTRYPOINT bash

FROM openmicroscopy/omero-ssh-systemd
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -re 's/Defaults\s+requiretty.*//' /etc/sudoers

# Install git
RUN yum install -y git && \
    yum clean all


# Prepare omero-install
ADD ./omero-install.sh /tmp/omero-install.sh
RUN chmod +x /tmp/omero-install.sh
RUN bash /tmp/omero-install.sh


# Add settings
ADD ./settings.env /tmp/omero-install/linux/settings.env
RUN chmod +x /tmp/omero-install/linux/settings.env

# Add OMERO_BRANCH to settings
ARG OMERO_BRANCH=OMERO-DEV-merge-build
RUN sed -i '1iexport OMERO_BRANCH='$OMERO_BRANCH'  '$1'\' /tmp/omero-install/linux/settings.env

# Add ARTEFACT to settings
ARG ARTEFACT=omego
RUN sed -i '1iexport ARTEFACT='$ARTEFACT'  '$1'\' /tmp/omero-install/linux/settings.env


# Customize steps
ADD ./install_steps/step01_centos7_pg_deps.sh /tmp/omero-install/linux/step01_centos7_pg_deps.sh
RUN chmod +x /tmp/omero-install/linux/step01_centos7_pg_deps.sh
ADD ./install_steps/step04_all_omero.sh /tmp/omero-install/linux/step04_all_omero.sh
RUN chmod +x /tmp/omero-install/linux/step04_all_omero.sh


RUN chmod a+X /home/omero

WORKDIR /tmp/omero-install/linux


# Build and install OMERO and its dependencies
ARG PGVER=pg94
ARG ICEVER=ice35-devel
ARG JAVAVER=openjdk18-devel
RUN JAVAVER=$JAVAVER ICEVER=$ICEVER PGVER=$PGVER bash install_centos7_nginx.sh

RUN su - postgres -c "/usr/pgsql-9.4/bin/pg_ctl start -D /var/lib/pgsql/9.4/data -w" \
    && sh /home/omero/createdb.sh


ADD ./runtest.sh /home/omero/runtest.sh
RUN chown omero:omero /home/omero/runtest.sh
RUN chmod +x /home/omero/runtest.sh


EXPOSE 22 80 4063 4064

#ENTRYPOINT bash

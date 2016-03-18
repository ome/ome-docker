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

# Add ARTEFACT to settings
ARG ARTEFACT=omego
RUN sed -i -e '1i'export ARTEFACT=$ARTEFACT'   '$1'\' /tmp/omero-install/linux/settings.env


# Customize steps
ADD ./install_steps/step04_all_omero.sh /tmp/omero-install/linux/step04_all_omero.sh
RUN chmod +x /tmp/omero-install/linux/step04_all_omero.sh
ADD ./install_steps/step05_centos7_nginx.sh /tmp/omero-install/linux/step05_centos7_nginx.sh
RUN chmod +x /tmp/omero-install/linux/step05_centos7_nginx.sh
ADD ./install_steps/step06_centos7_daemon.sh /tmp/omero-install/linux/step06_centos7_daemon.sh
RUN chmod +x /tmp/omero-install/linux/step06_centos7_daemon.sh


# Add omeroweb config
ADD ./omeroweb.config /home/omero/omeroweb.config
RUN chown omero:omero /home/omero/omeroweb.config


RUN chmod a+X /home/omero


WORKDIR /tmp/omero-install/linux


# Install OMERO.web and its dependencies
RUN JAVAVER=nojava PGVER=nopg bash install_centos7_nginx.sh


# Open port 80
EXPOSE 80


#ENTRYPOINT bash

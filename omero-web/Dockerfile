FROM openmicroscopy/omero-ssh-systemd
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -re 's/Defaults\s+requiretty.*//' /etc/sudoers

RUN yum install -y git && \
    yum clean all

ADD ./omero-install.sh /tmp/omero-install.sh
RUN chmod +x /tmp/omero-install.sh

ADD ./settings.env /tmp/settings.env
RUN chmod +x /tmp/settings.env

ADD ./to_replace/step02_all_setup.sh /tmp/step02_all_setup.sh
RUN chmod +x /tmp/step02_all_setup.sh
ADD ./to_replace/step03_all_postgres.sh /tmp/step03_all_postgres.sh
RUN chmod +x /tmp/step03_all_postgres.sh
ADD ./to_replace/step04_all_omero.sh /tmp/step04_all_omero.sh
RUN chmod +x /tmp/step04_all_omero.sh
ADD ./to_replace/step05_centos7_nginx.sh /tmp/step05_centos7_nginx.sh
RUN chmod +x /tmp/step05_centos7_nginx.sh
ADD ./to_replace/step06_centos7_daemon.sh /tmp/step06_centos7_daemon.sh
RUN chmod +x /tmp/step06_centos7_daemon.sh

ADD ./to_replace/setup_centos_selinux.sh /tmp/setup_centos_selinux.sh
RUN chmod +x /tmp/setup_centos_selinux.sh

ADD ./omeroweb.config /home/omero/omeroweb.config
RUN chown omero:omero /home/omero/omeroweb.config

RUN chmod a+X /home/omero

RUN /tmp/omero-install.sh

WORKDIR /tmp/omero-install/linux

RUN JAVAVER=nojava PGVER=nopg sh install_centos7_nginx.sh 

EXPOSE 80

#ENTRYPOINT bash

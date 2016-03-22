FROM openmicroscopy/omero-ssh-systemd
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -re 's/Defaults\s+requiretty.*//' /etc/sudoers

# install ansible
RUN yum install -y epel-release && \
    yum clean all

RUN yum update -y
RUN yum install -y ansible && \
    yum clean all

EXPOSE 22

# This will automatically start systemd
CMD ["/usr/sbin/init"]

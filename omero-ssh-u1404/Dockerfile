FROM ubuntu:14.04
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN update-locale LANG=C.UTF-8

RUN apt-get update -y && \
    apt-get install -y openssh-server

RUN mkdir /var/run/sshd && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' \
    -i /etc/pam.d/sshd

RUN useradd -m omero && \
    chsh -s /bin/bash omero && \
    echo 'omero:omero' | chpasswd omero && \
    echo "omero ALL= (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/omero

EXPOSE 22

CMD ["/usr/sbin/sshd", "-eD"]

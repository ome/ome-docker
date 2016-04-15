FROM centos:centos7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# Required for systemd
ENV container docker

RUN yum install -y sudo openssh-server openssh-clients && \
	yum clean all

RUN systemctl enable sshd.service

# Workaround to enable ssh logins
RUN sed -i \
	's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' \
	/etc/pam.d/sshd

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

RUN useradd omero && \
	echo 'omero:omero' | chpasswd && \
	echo "omero ALL= (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/omero

# Workaround as there is no need for udev or getty in containers.
# see https://bugzilla.redhat.com/show_bug.cgi?id=1046469#c11
RUN rm -f /lib/systemd/system/systemd*udev* ; \
	rm -f /lib/systemd/system/getty.target;

EXPOSE 22

# This will automatically start systemd
CMD ["/usr/sbin/init"]

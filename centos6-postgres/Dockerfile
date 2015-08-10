FROM centos:centos6
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# Not necessary but may be useful when used interactively
RUN yum install -y epel-release

RUN yum install -y sudo openssh-server openssh-clients && \
	yum install -y \
	http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm &&\
	yum install -y postgresql93-server postgresql93

RUN sed -i \
	's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' \
	/etc/pam.d/sshd && \
	/usr/bin/ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key \
	-C '' -N ''

RUN useradd omero && \
	echo 'omero:omero' | chpasswd omero &&\
	echo "omero ALL= (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/omero 

VOLUME ["/var/lib/pgsql"]
EXPOSE 22 5432

CMD ["/usr/sbin/sshd", "-eD"]


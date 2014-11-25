FROM centos:centos6
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN yum install -y \
	http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
	yum install -y make gcc readline-devel zlib-devel openssl-devel \
	libyaml redhat-lsb

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 && \
	curl -L https://get.rvm.io | bash -s stable
RUN bash -lc "source /usr/local/rvm/scripts/rvm && \
	rvm install 1.9.3 && \
	echo 'gem: --no-rdoc --no-ri' > /etc/gemrc && \
	gem install rails -v 3.2.21"


FROM centos6-ruby193-rails32
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

#ENV TARANTULA_VERSION master
ENV TARANTULA_VERSION 2014.26.1
RUN yum install -y unzip && \
	mkdir /tarantula-install

WORKDIR /tarantula-install
ADD https://raw.github.com/prove/tarantula/$TARANTULA_VERSION/vendor/installer/install.sh /tarantula-install/
ADD https://github.com/prove/tarantula/archive/$TARANTULA_VERSION.zip /tarantula-install/
RUN unzip $TARANTULA_VERSION.zip


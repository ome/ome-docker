FROM centos:centos6
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN yum install -y \
	http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
	centos-release-SCL
RUN yum install -y wget unzip zip tar git \
	java-1.6.0-openjdk-devel java-1.7.0-openjdk-devel
#RUN yum groupinstall -y development
RUN yum install -y git gcc-c++ gcc-gfortran \
	hdf5-devel atlas-devel zlib-devel \
	libjpeg-devel libpng-devel libtiff-devel freetype-devel

RUN yum install -y postgresql-server
# The CentOS 6.5 Docker image has a bug in selinux which will be fixed in 6.6. A temporary fix is in centosplus.
RUN yum install -y --enablerepo=centosplus postgresql92

# Python 2.6: Use older distro-compatible versions where possible
RUN yum install -y python-setuptools python-pip Cython python-nose \
	python-genshi epydoc \
	python-matplotlib numpy scipy
# numexpr must be installed before tables
RUN pip install sphinx pillow numexpr==1.4.2 && \
	pip install tables==2.4.0

# Python 2.7: Use latest released versions with the following exceptions:
# - matplotlib>=1.4.0 requires a more recent version of freetype than the distro version, but 1.3.1 uses a deprecated numpy API, so use the 1.3.x GitHub branch
RUN yum install -y python27
RUN ( source /opt/rh/python27/enable && \
	curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python2.7 - && \
	yum install -y python27-scipy python27-numpy && \
	pip install Cython nose genshi epydoc sphinx pillow && \
	pip install numexpr && \
	pip install tables \
	)
# Run as a separate layer since it seems to frequently change
RUN ( source /opt/rh/python27/enable && \
	pip install -U six && \
	pip install matplotlib \
	)

WORKDIR /opt

# Texlive
# fontconfig will already have been installed as an openjdk dependency
ADD texlive.profile /opt/
RUN curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | \
	tar -zxf - && \
	cd install-tl-*/ && \
	./install-tl -profile /opt/texlive.profile && \
	ln -s /opt/texlive/texmf-var/fonts/conf/texlive-fontconfig.conf \
		/etc/fonts/conf.d/09-texlive.conf && \
	fc-cache -rsfv
RUN echo 'PATH=/opt/texlive/bin/x86_64-linux:$PATH' > \
	/etc/profile.d/texlive.sh

# Zeroc Ice
RUN curl -L http://ci.openmicroscopy.org/job/ICE-centos6-archive/lastSuccessfulBuild/artifact/ice-multi-archive/centos6-ice-multi.tar.gz | \
	tar -zxf -

ADD multi-config.sh /opt/

RUN mkdir /build
VOLUME /build
WORKDIR /build


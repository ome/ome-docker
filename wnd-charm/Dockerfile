FROM centos:centos7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN yum install -y epel-release && \
    yum install -y gcc-c++ swig git \
        numpy scipy atlas libgfortran libjpeg-turbo numpy-f2py \
        fftw libtiff fftw-devel libtiff-devel suitesparse \
        python-devel python-nose python-pip python-setuptools && \
    yum clean all
RUN pip install git+https://github.com/wnd-charm/wnd-charm.git

# Additional useful tools
RUN yum install -y python-ipython && \
    yum clean all

RUN useradd -m wndcharm
USER wndcharm

CMD ["/usr/bin/ipython"]

FROM ubuntu:14.04
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update -y && \
    apt-get install -y \
        build-essential \
        git \
        ipython \
        libtiff4-dev \
        libfftw3-dev \
        python-dev \
        python-matplotlib \
        python-numpy \
        python-pip \
        python-scipy \
        python-setuptools \
        swig

RUN pip install git+https://github.com/wnd-charm/wnd-charm.git

RUN useradd -m wndcharm
USER wndcharm
WORKDIR /home/wndcharm
RUN git clone --depth 1 https://github.com/wnd-charm/wnd-charm.git


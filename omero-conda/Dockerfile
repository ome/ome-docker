FROM ubuntu:14.04
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update -y && \
        apt-get install -y --no-install-recommends \
        bzip2 \
        unzip \
        wget \
        postgresql-client \
        openjdk-7-jdk

RUN useradd -m omero

RUN cd /tmp && \
    wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh && \
    /bin/bash Miniconda-3.7.0-Linux-x86_64.sh -b -p /opt/anaconda && \
    rm Miniconda-3.7.0-Linux-x86_64.sh

RUN /opt/anaconda/bin/conda install --yes \
    numpy scipy matplotlib ipython pytables pillow pip

RUN echo 'export PATH=/opt/anaconda/bin:$PATH' >> .bashrc

RUN apt-get install -y make g++
RUN apt-get install -y libmcpp-dev libbz2-dev libexpat1-dev libssl-dev libdb5.1++-dev

RUN apt-get install -y patch
ADD Makefile.patch /tmp/
ADD ice-build /tmp/ice-build
RUN sh /tmp/ice-build && rm /tmp/ice-build

USER omero
ENV HOME /home/omero
WORKDIR /home/omero
RUN echo 'export PATH=/opt/anaconda/bin/:$PATH' >> ~/.bashrc

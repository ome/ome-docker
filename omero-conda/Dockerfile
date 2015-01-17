FROM ubuntu:12.04
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        unzip \
        wget \
        postgresql-client-9.1 \
        openjdk-7-jdk

RUN useradd -m omero

RUN cd /tmp && \
    wget http://repo.continuum.io/miniconda/Miniconda-3.4.2-Linux-x86_64.sh && \
    /bin/bash Miniconda-3.4.2-Linux-x86_64.sh -b -p /opt/anaconda && \
    rm Miniconda-3.4.2-Linux-x86_64.sh

RUN /opt/anaconda/bin/conda install --yes numpy && \
    /opt/anaconda/bin/conda install --yes scipy && \
    /opt/anaconda/bin/conda install --yes matplotlib && \
    /opt/anaconda/bin/conda install --yes ipython && \
    /opt/anaconda/bin/conda install --yes pytables && \
    /opt/anaconda/bin/conda install --yes pip

RUN /opt/anaconda/bin/pip install omego

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

ENTRYPOINT bash

FROM mini/base
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apk-install git && \
    mkdir /src

RUN time git clone --bare --depth=1 -b v5.1.0 https://github.com/ome/scripts/ /src/scripts.git
RUN time git clone --bare --depth=1 -b v5.1.0 https://github.com/openmicroscopy/openmicroscopy /src/omero.git
RUN time git clone --bare --depth=1 -b v5.1.0 https://github.com/openmicroscopy/bioformats /src/bio-formats.git

WORKDIR /src

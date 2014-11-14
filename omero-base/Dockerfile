FROM openmicroscopy/openjdk-ice34
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    postgresql-client-9.1 \
    python-imaging \
    python-numpy \
    python-tables \
    python-virtualenv \
    sudo \
    supervisor \
    unzip \
    vim \
    wget

RUN useradd -m omero
RUN su - omero -c "virtualenv --system-site-packages ~/venv"
RUN su - omero -c "~/venv/bin/pip install -U yaclifw && ~/venv/bin/pip install -U omego"

USER omero
ENV HOME /home/omero
WORKDIR /home/omero

CMD bash

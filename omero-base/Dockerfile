FROM joshmoore/openjdk-ice34
MAINTAINER Josh Moore <josh@glencoesoftware.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    postgresql-client-9.1 \
    python-imaging \
    python-numpy \
    python-virtualenv \
    sudo \
    supervisor \
    unzip \
    vim \
    wget

RUN useradd -m omero
RUN su - omero -c "virtualenv --system-site-packages ~/venv"
RUN su - omero -c "~/venv/bin/pip install yaclifw && ~/venv/bin/pip install omego"

USER omero
ENV HOME /home/omero
WORKDIR /home/omero

CMD bash

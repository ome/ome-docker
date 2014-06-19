FROM joshmoore/omero-base
MAINTAINER Josh Moore <josh@glencoesoftware.com>

USER root
RUN apt-get install -y --no-install-recommends\
    openjdk-7-jdk \
    git

USER omero
ENV HOME /home/omero
WORKDIR /home/omero

RUN venv/bin/pip install -U genshi

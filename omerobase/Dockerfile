FROM joshmoore/openjdk-ice34
MAINTAINER Josh Moore <josh@glencoesoftware.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y python-virtualenv
RUN apt-get install -y postgresql-client-9.1
RUN apt-get install -y supervisor
RUN apt-get install -y sudo
RUN apt-get install -y vim

RUN useradd -m omero
RUN su - omero -c "virtualenv --system-site-packages ~/venv"
RUN su - omero -c "~/venv/bin/pip install omego # v1"

USER omero
ENV HOME /home/omero
WORKDIR /home/omero

CMD bash

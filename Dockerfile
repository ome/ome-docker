FROM joshmoore/openjdk-ice34

RUN echo 127.0.0.1 `hostname` >>/etc/hosts
RUN useradd -m omero
RUN mkdir /OMERO
RUN chown omero /OMERO
RUN echo omero.data.dir=/home/omero/OMERO-DATA >> /tmp/settings
RUN apt-get install -y python-virtualenv wget unzip
RUN su - omero -c "virtualenv ~/venv"
RUN su - omero -c "~/venv/pip install omego"
RUN su - omero -c "omego upgrade --branch=OMERO-merge-develop-ice34"
RUN su - omero -c "mkdir ~/OMERO-DATA"
RUN su - omero -c "~/OMERO-CURRENT/bin/omero config load /tmp/settings"

EXPOSE 4063:4063 4064:4064

CMD su - omero -c /home/omero/OMERO.server/bin/omero

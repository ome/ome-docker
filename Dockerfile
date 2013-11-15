FROM joshmoore/openjdk-ice34

ENV BRANCH OMERO-merge-develop-ice34

RUN useradd -m omero
RUN mkdir /OMERO
RUN chown omero /OMERO
RUN echo omero.data.dir=/home/omero/OMERO-DATA >> /tmp/settings
RUN apt-get install -y python-virtualenv wget unzip
RUN su - omero -c "virtualenv --system-site-packages ~/venv"
RUN su - omero -c "~/venv/bin/pip install omego"
RUN su - omero -c "~/venv/bin/omego download --branch=$BRANCH server"
RUN su - omero -c "rm OMERO.server*zip"
RUN su - omero -c "ln -s OMERO.server* OMERO-CURRENT"
RUN su - omero -c "~/OMERO-CURRENT/bin/omero config load /tmp/settings"
RUN su - omero -c "mkdir ~/OMERO-DATA"

EXPOSE 4063:4063 4064:4064
USER omero

CMD /home/omero/OMERO-CURRENT/bin/omero

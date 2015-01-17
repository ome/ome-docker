FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

ENV BRANCH OMERO-5.0-merge-build

RUN useradd -m omero
RUN mkdir /OMERO
RUN chown omero /OMERO
RUN echo omero.data.dir=/home/omero/OMERO-DATA >> /tmp/settings
RUN apt-get install -y python-virtualenv wget unzip
RUN su - omero -c "virtualenv --system-site-packages ~/venv"
RUN su - omero -c "~/venv/bin/pip install omego"
RUN su - omero -c "~/venv/bin/omego download --branch=$BRANCH server --labels ICE=3.4"
RUN su - omero -c "rm OMERO.server*zip"
RUN su - omero -c "ln -s OMERO.server* OMERO-CURRENT"
RUN su - omero -c "~/OMERO-CURRENT/bin/omero config load /tmp/settings"
RUN su - omero -c "mkdir ~/OMERO-DATA"

RUN echo 'cd /home/omero/OMERO-CURRENT' >> /home/omero/start.sh
RUN echo 'bin/omero config set omero.db.host $PG_PORT_5432_TCP_ADDR' >> /home/omero/start.sh
RUN echo 'bin/omero config set omero.db.port $PG_PORT_5432_TCP_PORT' >> /home/omero/start.sh
RUN echo 'mkdir -p var/master' >> /home/omero/start.sh
RUN echo 'mkdir -p var/registry' >> /home/omero/start.sh
RUN echo 'icegridnode --nochdir --Ice.Config=etc/internal.cfg,etc/master.cfg --deploy etc/grid/default.xml' >> /home/omero/start.sh

ENV PASSWORD omero

RUN echo 'HOST="$PG_PORT_5432_TCP_ADDR"' >> /home/omero/init.sh
RUN echo 'PORT="$PG_PORT_5432_TCP_PORT"' >> /home/omero/init.sh
RUN echo 'cd /home/omero/OMERO-CURRENT' >> /home/omero/init.sh
RUN echo 'bin/omero db script "" "" "$PASSWORD" -f /data/init_db.sql' >> /home/omero/init.sh
RUN echo 'createuser -h "$HOST" -p "$PORT" -U postgres -s omero' >> /home/omero/init.sh
RUN echo 'createdb -h "$HOST" -p "$PORT" -O omero omero' >> /home/omero/init.sh
RUN echo 'psql -h "$HOST" -p "$PORT" -U omero omero -f /data/init_db.sql' >> /home/omero/init.sh

RUN apt-get install -y postgresql-client-9.1

USER omero
ENV HOME /home/omero
WORKDIR /home/omero

CMD sh start.sh

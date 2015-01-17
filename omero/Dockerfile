FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

ENV BRANCH OMERO-5.0-merge-build

USER root
RUN mkdir /OMERO
RUN chown omero /OMERO
RUN echo omero.data.dir=/home/omero/OMERO-DATA >> /tmp/settings
RUN apt-get install -y python-virtualenv wget unzip

USER omero
RUN virtualenv --system-site-packages ~/venv
RUN ~/venv/bin/pip install omego
RUN ~/venv/bin/omego download --branch=$BRANCH server --labels ICE=3.5
RUN rm OMERO.server*zip
RUN ln -s OMERO.server* OMERO-CURRENT
RUN (/opt/anaconda/bin/python ~/OMERO-CURRENT/bin/omero config load /tmp/settings)
RUN mkdir ~/OMERO-DATA

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

USER omero
ENV HOME /home/omero
WORKDIR /home/omero

CMD sh start.sh

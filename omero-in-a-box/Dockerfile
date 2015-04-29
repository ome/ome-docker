FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

USER root

RUN apt-get install -y nginx postgresql postgresql-contrib supervisor sudo vim

RUN mkdir -p /data/supervisor
RUN mkdir -p /data/OMERO
RUN chown omero /data/OMERO
RUN ln -s /data/OMERO /OMERO

ENV PGVER 9.3
ENV PGETC /etc/postgresql/9.3/
ENV PGCONF $PGETC/postgresql.conf
ENV PGHBA  $PGETC/pg_hba.conf
ENV PGEXEC /usr/lib/postgresql/$PGVER/bin

RUN echo "listen_addresses = '*'" >> "$PGCONF"
RUN perl -i -pe 's/^(host.*)md5$/$1trust/g' $PGHBA

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:omero' |chpasswd

ADD ./supervisord.conf /etc/supervisor/
ADD ./supervisord /supervisord
ADD ./nginx /nginx
ADD ./omero /omero
ADD ./omero-setup /omero-setup
ADD ./postgresql /postgresql
ADD ./postgresql-setup /postgresql-setup
ADD ./web /web
ADD ./wait_on_postgresql /wait_on_postgresql
ADD ./wait_on_omero /wait_on_omero

EXPOSE 22 80 4064 4064 5432

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

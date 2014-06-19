FROM joshmoore/omero-base
MAINTAINER Josh Moore <josh@glencoesoftware.com>

USER root

RUN apt-get install -y nginx postgresql postgresql-contrib supervisor

RUN mkdir -p /data/OMERO
RUN chown omero /data/OMERO
RUN ln -s /data/OMERO /OMERO

ENV PGVER 9.1
ENV PGETC /etc/postgresql/9.1/
ENV PGCONF $PGETC/postgresql.conf
ENV PGHBA  $PGETC/pg_hba.conf
ENV PGEXEC /usr/lib/postgresql/$PGVER/bin

RUN echo "listen_addresses = '*'" >> "$PGCONF"
RUN perl -i -pe 's/^(host.*)md5$/$1trust/g' $PGHBA

ADD ./supervisord.conf /etc/supervisor/
ADD ./nginx /nginx
ADD ./omero /omero
ADD ./postgresql /postgresql
ADD ./web /web
ADD ./wait_on_postgresql /wait_on_postgresql

EXPOSE 80 4064 4064 5432

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

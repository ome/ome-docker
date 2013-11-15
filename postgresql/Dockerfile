FROM felix/postgresql
MAINTAINER Josh Moore <josh@glencoesoftware.com>

ENV ETC /etc/postgresql/9.3/main/
ENV VAR /var/lib/postgresql/9.3/main/

ENV CONF $ETC/postgresql.conf
ENV HBA  $ETC/pg_hba.conf
ENV EXEC /usr/lib/postgresql/9.3/bin/postgres

ENV PORT 5432

RUN echo "listen_addresses = '*'" >> "$CONF"
RUN perl -i -pe 's/^(host.*)md5$/$1trust/g' $HBA
RUN echo "host    all             all             OMEROHOST/32           trust" >> $HBA

RUN echo 'perl -i -pe "s/OMEROHOST/$OMERO_PORT_4064_TCP_ADDR/g" $HBA' >> ~/start.sh 
RUN echo '"$EXEC" -p "$PORT" -D "$VAR" -c config_file="$CONF"' >> ~/start.sh

USER postgres
CMD sh ~/start.sh

FROM mattdm/fedora-small
MAINTAINER Simon Li "spli@dundee.ac.uk"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-*-x86_64
RUN yum -y install postgresql-server postgres

ENV PGDATA /var/lib/pgsql/data

# Initialise and configure database
RUN su -l - postgres -c "pg_ctl init -o '--auth-local=peer --auth-host=md5'"
RUN echo "host all all 0.0.0.0/0 md5" >> $PGDATA/pg_hba.conf && \
    sed -i 's/logging_collector = on/logging_collector = off/' \
        $PGDATA/postgresql.conf && \
    echo "listen_addresses = '*'" >> $PGDATA/postgresql.conf
# Create a user account and db
RUN su -l - postgres -c " \
    pg_ctl start -w && \
    psql --command \"CREATE USER omero WITH SUPERUSER PASSWORD 'omero';\" && \
    createdb -O omero omero && \
    pg_ctl stop"

# User for running the image
USER postgres

EXPOSE 5432

# Add VOLUME to allow backup of config and databases
VOLUME ["/var/lib/pgsql"]

# Set the default command to run when starting the container
CMD /usr/bin/postgres -D $PGDATA -c config_file=$PGDATA/postgresql.conf

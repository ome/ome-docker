#!/bin/bash

PGVER=${PGVER:-pg94}

# Postgres installation
if [ "$PGVER" = "pg94" ]; then
    # Install Postgres Version 9.4
    yum -y install \
        http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm && \
        yum clean all

    yum -y install postgresql94-server postgresql94 && \
        yum clean all

    sed -i 's/OOMScoreAdjust/#OOMScoreAdjust/' /usr/lib/systemd/system/postgresql-9.4.service

    systemctl enable postgresql-9.4.service

    # configure postgress
    su - postgres -c "/usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/9.4/data --encoding=UTF8"
    su - postgres -c "echo 'host    all             all             127.0.0.1/32            trust' >> /var/lib/pgsql/9.4/data/pg_hba.conf"
    su - postgres -c "echo \"listen_addresses='*'\" >> /var/lib/pgsql/9.4/data/postgresql.conf"

elif [ "$PGVER" = "pg95" ]; then
    # Install Postgres Version 9.5
    yum -y install \
        http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm && \
        yum clean all

    yum -y install postgresql95-server postgresql95 && \
        yum clean all

    sed -i 's/OOMScoreAdjust/#OOMScoreAdjust/' /usr/lib/systemd/system/postgresql-9.5.service

    systemctl enable postgresql-9.5.service

    # configure postgress
    su - postgres -c "/usr/pgsql-9.5/bin/initdb -D /var/lib/pgsql/9.5/data --encoding=UTF8"
    su - postgres -c "echo 'host    all             all             127.0.0.1/32            trust' >> /var/lib/pgsql/9.4/data/pg_hba.conf"
    su - postgres -c "echo \"listen_addresses='*'\" >> /var/lib/pgsql/9.5/data/postgresql.conf"

fi



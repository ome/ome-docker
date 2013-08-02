#!/bin/sh -eu

apt-get update

apt-get install -y postgresql
su - postgres -c "echo create user ${DB_USER-omero} password \'${DB_PASS-omero}\' | psql"
su - postgres -c "createdb -O ${DB_USER-omero} ${DB_NAME-omero}"

useradd -m omero
mkdir /OMERO
chown omero /OMERO

apt-get install -y wget unzip
su - omero -c "wget http://cvs.openmicroscopy.org.uk/snapshots/omero/4.4.8p1/OMERO.server-4.4.8p1-ice34-b304.zip -P /tmp/"
su - omero -c "unzip /tmp/OMERO.server-4.4.8p1-ice34-b304.zip -d /home/omero/"
su - omero -c "rm /tmp/OMERO.server-4.4.8p1-ice34-b304.zip"
su - omero -c "ln -s /home/omero/OMERO.server-4.4.8p1-ice34-b304 /home/omero/OMERO.server"

apt-get install -y zeroc-ice34 openjdk-7-jre-headless
update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

su - omero -c "/home/omero/OMERO.server/bin/omero db script -f - OMERO4.4 0 ${ROOT_PASS-omero}" | PGPASSWORD=${DB_PASS-omero} psql -h ${DB_HOST-localhost} -U ${DB_USER-omero} ${DB_NAME-omero}

#!/bin/sh -eu

apt-get update

apt-get install -y postgresql 
su - postgres -c "createuser -D -R -S omero"
su - postgres -c "createdb -O omero omero"
sed -i "/127.0.0.1/s/md5/trust/" /etc/postgresql/9.1/main/pg_hba.conf
/etc/init.d/postgresql reload
psql -h localhost -U omero omero </tmp/OMERO4.4__0.sql

useradd -m omero

apt-get install -y wget unzip
su - omero -c "wget http://cvs.openmicroscopy.org.uk/snapshots/omero/4.4.8p1/OMERO.server-4.4.8p1-ice34-b304.zip -P /home/omero/"
su - omero -c "unzip /home/omero/OMERO.server-4.4.8p1-ice34-b304.zip -d /home/omero/"
su - omero -c "ln -s /home/omero/OMERO.server-4.4.8p1-ice34-b304 /home/omero/OMERO.server"

apt-get install -y zeroc-ice34 openjdk-7-jre-headless
update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
su - omero -c "mkdir /home/omero/OMERO"
su - omero -c "/home/omero/OMERO.server/bin/omero config set omero.data.dir /home/omero/OMERO"

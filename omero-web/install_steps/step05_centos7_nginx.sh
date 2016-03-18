#!/bin/bash

#start-copy
cp setup_omero_nginx.sh ~omero
#end-copy

#start-install
yum -y --enablerepo=cr install nginx

pip install -r ~omero/OMERO.server/share/web/requirements-py27-nginx.txt

# set up as the omero user.
su - omero -c "bash -eux setup_omero_nginx.sh"

sed -i.bak -re 's/( default_server.*)/; #\1/' /etc/nginx/nginx.conf
cp ~omero/OMERO.server/nginx.conf.tmp /etc/nginx/conf.d/omero-web.conf

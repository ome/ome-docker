#!/bin/bash

set -e -u -x

cp omero-web-systemd.service /etc/systemd/system/omero-web.service
ln -s /etc/systemd/system/omeroweb.service /etc/systemd/system/multi-user.target.wants/omero-web.service
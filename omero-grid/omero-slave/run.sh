#!/bin/bash

env

export HOME=/home/omero
cd $HOME
omero=$HOME/OMERO.server/bin/omero

MASTER_IP=$MASTER_PORT_4061_TCP_ADDR
SLAVE_IP=$(ip addr show eth0 | sed -nre 's/.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/p')

sed -i -e "s/%MASTER_IP%/$MASTER_IP/" $HOME/OMERO.server/etc/internal.cfg $HOME/OMERO.server/etc/ice.config
sed -i -e "s/%SLAVE_IP%/$SLAVE_IP/" $HOME/OMERO.server/etc/omero-slave.cfg

$omero node omero-slave start

# We need a command that won't exit to keep the container running
tail -F $HOME/OMERO.server/var/log/Processor-0.log

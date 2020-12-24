#!/bin/bash

printf "\n\
==========================\n\
  Updating resolve.conf \n\
==========================\n\
"

BASEDIR=$(dirname $0)

./cmp_config.sh $BASEDIR/../etc/systemd/resolved.conf /etc/systemd/resolved.conf

systemctl restart systemd-resolved
apt update

# Forward all localhost ports to default interface
addLine="net.ipv4.conf.all.route_localnet = 1"

grep -qxF "$addLine" /etc/sysctl.conf || echo $addLine >> /etc/sysctl.conf

# Apply the change
sudo sysctl -p /etc/sysctl.conf

#!/bin/bash

printf "\n\
==========================\n\
  Updating resolve.conf \n\
==========================\n\
"

BASEDIR=$(dirname $0)

cp $BASEDIR/../etc/systemd/resolved.conf /etc/systemd/resolved.conf

systemctl restart systemd-resolved
apt update

# Forward all localhost ports to default interface
echo 'net.ipv4.conf.all.route_localnet = 1' | sudo tee -a /etc/sysctl.conf
# Apply the change
sudo sysctl -p /etc/sysctl.conf
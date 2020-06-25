#!/bin/bash

if [ ! -f "/etc/rm-install/stage" ]; then
  BASEDIR=$(dirname $0)
  
  echo "Initializing. Creating /etc/stage"
  mkdir /etc/rm-install
  cp $BASEDIR/../etc/rm-install/stage /etc/rm-install/stage
fi
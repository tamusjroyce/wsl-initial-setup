#!/bin/bash

#if [ ! -f "/etc/rm-install/stage" ]; then
  BASEDIR=$(dirname $0)

  echo "Initializing. Creating /etc/stage"
  mkdir /etc/rm-install || echo "/etc/rm-install directory already made"
  ./cmp_config.sh $BASEDIR/../etc/rm-install/stage /etc/rm-install/stage
#fi

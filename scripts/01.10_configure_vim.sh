#!/bin/bash

printf "\n\
==========================\n\
     CONFIGURING VIM\n\
==========================\n\
"

BASEDIR=$(dirname $0)

./cmp_config.sh $BASEDIR/../home/.vimrc /home/$SUDO_USER/.vimrc
./cmp_config.sh $BASEDIR/../home/.vimrc ~/.vimrc

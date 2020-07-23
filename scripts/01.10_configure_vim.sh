#!/bin/bash

printf "\n\
==========================\n\
     CONFIGURING VIM\n\
==========================\n\
"

BASEDIR=$(dirname $0)

cp $BASEDIR/../home/.vimrc /home/$SUDO_USER/.vimrc
cp $BASEDIR/../home/.vimrc ~/.vimrc

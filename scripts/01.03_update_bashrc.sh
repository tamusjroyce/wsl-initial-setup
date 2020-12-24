#!/bin/bash
printf "\n\
==========================\n\
     CONFIGURING BASH\n\
==========================\n\
"
BASEDIR=$(dirname $0)

./cmp_config.sh $BASEDIR/../home/.bashrc /home/$SUDO_USER/.bashrc
./cmp_config.sh $BASEDIR/../home/.bashrc ~/.bashrc

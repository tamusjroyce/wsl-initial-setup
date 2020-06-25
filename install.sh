#!/bin/bash

BASEDIR=$(dirname $0)

bash $BASEDIR/scripts/00.00_init_stage.sh

currentStage=$(cat /etc/rm-install/stage)
echo "Current Stage is: $currentStage"

if [[ currentStage -eq 0 ]]; then
  $BASEDIR/scripts/00.01_enable_systemd.sh && \
  $BASEDIR/Scripts/00.99_next_stage.sh
fi

if [[ currentStage -eq 1 ]]; then
  $BASEDIR/scripts/01.01_update_resolved.conf.sh
  $BASEDIR/scripts/01.02_install_powerline.sh
  $BASEDIR/scripts/01.03_update_bashrc.sh
  $BASEDIR/scripts/01.04_install_microk8s.sh
  $BASEDIR/scripts/01.05_install_docker.sh
  $BASEDIR/scripts/01.06_install_kubectl.sh
  $BASEDIR/Scripts/01.99_next_stage.sh
fi

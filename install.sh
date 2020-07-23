#!/bin/bash

printf "\n\
Hello\n\
World\
"

BASEDIR=$(dirname $0)

bash $BASEDIR/scripts/00.00_init_stage.sh

currentStage=$(cat /etc/rm-install/stage)
echo "Current Stage is: $currentStage"

if [[ currentStage -eq 0 ]]; then
  $BASEDIR/scripts/00.01_enable_systemd.sh && \
  $BASEDIR/scripts/00.99_next_stage.sh
fi

if [[ currentStage -eq 1 ]]; then
  $BASEDIR/scripts/01.01_update_resolved.conf.sh
  $BASEDIR/scripts/01.02_install_powerline.sh
  $BASEDIR/scripts/01.03_update_bashrc.sh
  $BASEDIR/scripts/01.04_install_microk8s.sh
  $BASEDIR/scripts/01.05_install_docker.sh
  $BASEDIR/scripts/01.06_install_kubectl.sh
  $BASEDIR/scripts/01.07_install_helm.sh
  $BASEDIR/scripts/01.08_install_skaffold.sh
  $BASEDIR/scripts/01.09_install_personal_settings.sh
  $BASEDIR/scripts/01.10_configure_vim.sh
  $BASEDIR/scripts/01.11_install_nodejs.sh
  $BASEDIR/scripts/01.99_next_stage.sh
fi

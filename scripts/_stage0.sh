#!/bin/bash

BASEDIR=$(dirname $0)
RUN_NEXT_STAGE=$1

systemd(){
  $BASEDIR/00.01_enable_systemd.sh
}


I_WSL_TOOLS=$(whiptail --checklist "WSL - Select Components (Deselect all if in vm or regular linux))" 10 50 2 \
  systemd     "Enable Systemd (Only WSL)"     on \
  3>&1 1>&2 2>&3)

read -a I_WSL_TOOLS <<< $I_WSL_TOOLS

for component_script in "${I_WSL_TOOLS[@]}"; do
  eval $component_script
done

### NEXT STAGE ###
if [[ $RUN_NEXT_STAGE == "yes" ]]; then
  $BASEDIR/00.99_next_stage.sh
fi

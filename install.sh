#!/bin/bash

BASEDIR=$(dirname $0)

bash $BASEDIR/scripts/00.00_init_stage.sh

currentStage=$(cat /etc/rm-install/stage)
echo "Current Stage is: $currentStage"

if [[ currentStage -eq 0 ]]; then
  $BASEDIR/scripts/_stage0.sh yes
fi

if [[ currentStage -eq 1 ]]; then
  $BASEDIR/scripts/_stage1.sh yes
fi

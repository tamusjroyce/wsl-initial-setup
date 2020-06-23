BASEDIR=$(dirname $0)

sh $BASEDIR/scripts/00.00_init_stage.sh

currentStage=$(cat /etc/rm-install/stage)
echo "Current Stage is: $currentStage"

if [[ currentStage -eq 0 ]]; then
  sh $BASEDIR/scripts/00.01_enable_systemd.sh && \
  sh $BASEDIR/Scripts/00.99_next_stage.sh
fi

if [[ currentStage -eq 1 ]]; then
  sh $BASEDIR/scripts/01.01_update_resolved.conf.sh && \
  sh $BASEDIR/scripts/01.02_install_powerline.sh && \
  sh $BASEDIR/scripts/01.03_update_bashrc.sh && \
  sh $BASEDIR/scripts/01.04_install_microk8s.sh && \
  sh $BASEDIR/Scripts/01.99_next_stage.sh
fi

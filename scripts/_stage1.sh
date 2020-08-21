#!/bin/bash

BASEDIR=$(dirname $0)
RUN_NEXT_STAGE=$1


### CLOUD TOOLS ###
I_CLOUD_TOOLS=$(whiptail \
  --checklist "Cloud Tools - Select Components" 10 50 6 \
  powerline   "Powerline Fonts in Bash"   on \
  microk8s    "MicroK8s"                  on \
  docker      "Docker"                    on \
  kubectl     "kubectl"                   on \
  helm        "helm"                      on \
  skaffold    "skaffold"                  on \
  3>&1 1>&2 2>&3)

read -a I_CLOUD_TOOLS <<< $I_CLOUD_TOOLS


powerline(){
  echo "INSTALLING POWERLINE...."
  $BASEDIR/01.02_install_powerline.sh && \
  $BASEDIR/01.03_update_bashrc.sh
}

microk8s(){
  $BASEDIR/01.04_install_microk8s.sh
}

docker(){
  $BASEDIR/01.05_install_docker.sh
}

kubectl(){
  $BASEDIR/01.06_install_kubectl.sh
}

helm(){
  $BASEDIR/01.07_install_helm.sh
}

skaffold(){
  $BASEDIR/01.08_install_skaffold.sh
}

$BASEDIR/01.01_update_resolved.conf.sh

for install_module in "${I_CLOUD_TOOLS[@]}"; do
  eval $install_module
done

### DEV TOOLS ###

vim(){
  $BASEDIR/01.10_configure_vim.sh
}

nano(){
  $BASEDIR/01.12_configure_nano.sh
}

nodejs(){
  $BASEDIR/01.11_install_nodejs.sh
}

ssh(){
  $BASEDIR/01.13_install_open_ssh_server.sh
}

I_DEV_TOOLS=$(whiptail --checklist "Dev Tools - Select Components" 10 50 2 \
  vim       "Recommended vim settings"    on \
  nodejs    "NodeJs"                      on \
  nano      "Recommended nano settings"   on \
  ssh	    "Open SSH Server"       	  on \
  3>&1 1>&2 2>&3)

read -a I_DEV_TOOLS <<< $I_DEV_TOOLS

for install_module in "${I_DEV_TOOLS[@]}"; do
  eval $install_module
done

### NEXT STAGE ###

if [[ $RUN_NEXT_STAGE == "yes" ]]; then
  $BASEDIR/01.99_next_stage.sh
fi

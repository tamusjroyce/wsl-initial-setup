#!/bin/bash

printf "\n\
==========================\n\
    INSTALLING MICROK8S\n\
==========================\n\
"

snap install microk8s --classic
usermod -a -G microk8s $SUDO_USER
chown -f -R $SUDO_USER ~/.kube 
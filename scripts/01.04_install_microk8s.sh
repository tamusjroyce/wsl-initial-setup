#!/bin/bash

snap install microk8s --classic
usermod -a -G microk8s $SUDO_USER
chown -f -R $SUDO_USER ~/.kube 
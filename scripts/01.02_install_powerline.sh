#!/bin/bash

apt update && apt upgrade -y

apt install -y golang-go
sudo -u $SUDO_USER go get -u github.com/justjanne/powerline-go
apt install -y fonts-powerline

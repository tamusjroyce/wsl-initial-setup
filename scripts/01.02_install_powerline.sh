#!/bin/bash
printf "\n\
==========================\n\
INSTALLING POWERLINE FONTS\n\
==========================\n\
"

apt update && apt upgrade -y

# Install Go and Powerline fonts
apt install -y golang-go
apt install -y fonts-powerline

# Get Powerline-go for root and user
sudo -u $SUDO_USER go get -u github.com/justjanne/powerline-go
go get -u github.com/justjanne/powerline-go

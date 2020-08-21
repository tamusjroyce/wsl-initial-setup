#!/bin/bash
printf "\n\
==========================\n\
INSTALLING POWERLINE FONTS\n\
==========================\n\
"

apt-get update && apt-get upgrade -y

# Install Go and Powerline fonts
apt-get install -y golang-go
apt-get install -y fonts-powerline

# Get Powerline-go for root and user
sudo -u $SUDO_USER go get -u github.com/justjanne/powerline-go
go get -u github.com/justjanne/powerline-go

#!/bin/sh

apt update && apt upgrade -y

apt install -y golang-go
go get -u github.com/justjanne/powerline-go
apt install -y fonts-powerline

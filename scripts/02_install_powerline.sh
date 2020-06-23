#!/bin/sh

BASEDIR=$(dirname $0)

apt update && apt upgrade -y

apt install -yqq fonts-powerline
apt install -yqq golang-go
go get -u https://github.com/justjanne/powerline-go

cat $BASEDIR/../home/.bashrc.add >> ~/.bashrc

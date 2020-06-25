#!/bin/bash

BASEDIR=$(dirname $0)

cp $BASEDIR/../home/.bashrc /home/$SUDO_USER/.bashrc
cp $BASEDIR/../home/.bashrc ~/.bashrc

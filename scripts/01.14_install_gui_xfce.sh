#!/bin/bash
printf "\n\
==========================\n\
INSTALLING OPEN SSH SERVER\n\
==========================\n\
"

apt-get install -y dbus-x11
apt-get install -y xfce4 slim
apt-get install -y pm-utils

dbus-uuidgen --ensure

systemctl enable dbus || echo "systemctl didn't enable dbus"
/etc/init.d/dbus start || echo "could not start dbus"

export DISPLAY=127.0.0.1:0.0
dbus-launch --exit-with-x11

apt purge xscreensaver gnome-screensaver

for dir in /home/*/
do
    echo "export DISPLAY=:0.0" >> "${dir}.bashrc"
done


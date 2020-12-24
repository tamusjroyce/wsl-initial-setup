#!/bin/bash

printf "\n\
==========================\n\
     ENABLING SYSTEMD\n\
==========================\n\
"

BASEDIR=$(dirname $0)

# Updaete the system
apt-get update && apt-get upgrade -y

# Switch from Systemd command to Sysvinit command
chmod -x /usr/bin/systemctl
cp $BASEDIR/../usr/sbin/systemctl /usr/sbin/systemctl
chmod +x /usr/sbin/systemctl

# Install the required packages for SystemD
apt-get install -yqq fontconfig daemonize
# Creates a default user and adds it to the sudo group
read -p "Please enter desired username: " username
echo

if id "$username" &>/dev/null; then
    echo "$1 user found"
else
    read -p "Does this user already exist? [y/n]" userexists
    echo

    if [[ "$userexists" -eq "y" || "$userexists" -eq "Y" ]]; then
        echo "skip setting user" 
    else
        useradd -m -s /bin/bash -G sudo $username
        # Reset the password of the default user
        passwd $username
    fi
fi

./cmp_config.sh $BASEDIR/../etc/sudoers /etc/sudoers
./cmp_config.sh $BASEDIR/../etc/wsl.conf /etc/wsl.conf
printf "default = $username \n" >> /etc/wsl.conf
./cmp_config.sh $BASEDIR/../etc/profile.d/00-wsl2-systemd.sh /etc/profile.d/00-wsl2-systemd.sh

export CREATED_USER=$username

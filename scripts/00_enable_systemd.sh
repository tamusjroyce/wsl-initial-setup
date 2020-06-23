BASEDIR=$(dirname $0)

# Updaete the system
apt update && apt upgrade -y

# Install the required packages for SystemD
apt install -yqq fontconfig daemonize
# Creates a default user and adds it to the sudo group
useradd -m -s /bin/bash -G sudo mk8s
# Reset the password of the default user
passwd mk8s

cp $BASEDIR/../etc/sudoers /etc/sudoers
cp $BASEDIR/../etc/wsl.conf /etc/wsl.conf
cp $BASEDIR/../etc/profile.d/00-wsl2-systemd.sh /etc/profile.d/00-wsl2-systemd.sh

echo "sytemd enabled. Please restart wsl"
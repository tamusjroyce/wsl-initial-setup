printf "\n\
==========================\n\
     PERSONAL SETTINGS \n\
==========================\n\
"

BASEDIR=$(dirname $0)

if [[ $SUDO_USER == "reliefmelone" ]]; then
  cp $BASEDIR/../home/.gitconfig /home/$SUDO_USER/.gitconfig
  cp $BASEDIR/../home/.gitconfig ~/.gitconfig

  cp $BASEDIR/../etc/inputrc /etc/inputrc

  ln -s /mnt/c/coding_local /coding_local
fi

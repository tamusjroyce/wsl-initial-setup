BASEDIR=$(dirname $0)

if [[ $SUDO_USER == "reliefmelone" ]]; then

  printf "\n\
  User reliefmelone detected
==========================\n\
     PERSONAL SETTINGS \n\
==========================\n\
"
  echo "=======Setting .gitconfig"
  cp $BASEDIR/../home/.gitconfig /home/$SUDO_USER/.gitconfig
  cp $BASEDIR/../home/.gitconfig ~/.gitconfig
  echo "=======Setting inputrc"
  cp $BASEDIR/../etc/inputrc /etc/inputrc
  echo "=======Linking coding_local"
  ln -s /mnt/c/coding_local /coding_local
fi

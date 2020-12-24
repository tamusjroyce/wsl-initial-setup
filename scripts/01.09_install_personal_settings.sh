BASEDIR=$(dirname $0)

if [[ $SUDO_USER == "reliefmelone" ]]; then

  printf "\n\
  User reliefmelone detected
==========================\n\
     PERSONAL SETTINGS \n\
==========================\n\
"
  echo "=======Setting .gitconfig"
  ./cmp_config.sh cp $BASEDIR/../home/.gitconfig /home/$SUDO_USER/.gitconfig
  ./cmp_config.sh cp $BASEDIR/../home/.gitconfig ~/.gitconfig
  echo "=======Setting inputrc"
  ./cmp_config.sh $BASEDIR/../etc/inputrc /etc/inputrc
  echo "=======Linking coding_local"
  ln -s /mnt/c/coding_local /coding_local
fi

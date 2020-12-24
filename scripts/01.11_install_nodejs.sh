#!/bin/bash

printf "\n\
==========================\n\
     INSTALLING NODEJS\n\
==========================\n\
"

if [[ !$(command -v curl) ]]; then
  apt-get install -y curl
fi

curl  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
sudo -u $SUDO_USER curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | sudo -u $SUDO_USER bash

export NVM_DIR=/home/$SUDO_USER/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install stable
nvm use stable

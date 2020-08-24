#!/bin/bash

printf "\n\
==========================\n\
     INSTALLING NODEJS\n\
==========================\n\
"

if [[ !$(command -v curl) ]]; then
  apt-get install -y curl
fi

sudo -u $SUDO_USER curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | sudo -u $SUDO_USER bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "/home/$SUDO_USER/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install stable
nvm use stable

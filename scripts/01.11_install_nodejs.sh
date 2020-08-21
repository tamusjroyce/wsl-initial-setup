#!/bin/bash

printf "\n\
==========================\n\
     INSTALLING NODEJS\n\
==========================\n\
"

if [[ !$(command -v curl) ]]; then
  apt-get install -y curl
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

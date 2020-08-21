#!/bin/bash

printf "\n\
==========================\n\
    CONFIGURING NANO\n\
==========================\n\
"


# ADD SYNTAX SUPPORT
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sudo -u default sh


addLine="include \"~/.nano/ts.nanorc\""

grep -qxF "$addLine" ~/.nanorc || echo $addLine >> ~/.nanorc
grep -qxF "$addLine" /home/$SUDO_USER/.nanorc || echo $addLine >> /home/$SUDO_USER/.nanorc


# SET FORMATTING

formatTabsize="set tabsize 2"
formatTabsToSpaces="set tabstospaces"


grep -qxF "$formatTabsize" ~/.nanorc || echo -e $formatTabsize >> ~/.nanorc
grep -qxF "$formatTabsize" /home/$SUDO_USER/.nanorc || echo -e $formatTabsize >> /home/$SUDO_USER/.nanorc

grep -qxF "$formatTabsToSpaces" /home/$SUDO_USER/.nanorc || echo -e $formatTabsToSpaces >> /home/$SUDO_USER/.nanorc
grep -qxF "$formatTabsToSpaces" ~/.nanorc || echo -e $formatTabsToSpaces >> ~/.nanorc

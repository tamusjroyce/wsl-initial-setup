#!/bin/bash

echo "1" > /etc/rm-install/stage

echo "sytemd enabled. Please restart using:"
echo "wsl -d ubuntu --user [your-username] sudo /bin/bash /mnt/c/path/to/install.sh"

exit
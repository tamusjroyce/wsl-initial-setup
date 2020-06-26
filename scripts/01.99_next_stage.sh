#!/bin/bash

echo "2" > /etc/rm-install/stage

echo "Stage 1 complete. You can now start WLS with"
echo "wsl -d ubuntu --user [your-username]"
exit
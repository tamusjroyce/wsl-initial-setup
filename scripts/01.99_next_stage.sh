#!/bin/bash

echo "2" > /etc/rm-install/stage

echo "Stage 1 complete. Please exit and reopen with \"wsl --user $($ROOT_USER || whoami)\""
sleep 5
exit